; DESCRIPTION: Composite: Draws a purple circle centered at (346, 80) with radius 48 then Renders a green line between points (59, 209) and (20, 15).
; PLAN: r0=346(x), r1=80(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x1), r6=209(y1), r7=20(x2), r8=15(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 80
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 209
LDI r7, 20
LDI r8, 15
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
