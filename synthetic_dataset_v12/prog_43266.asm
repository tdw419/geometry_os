; DESCRIPTION: Composite: Places a blue line segment connecting (80, 215) to (20, 11) then Places a red circle of radius 39 at center (91, 166).
; PLAN: r0=80(x1), r1=215(y1), r2=20(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=91(x), r6=166(y), r7=39(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 215
LDI r2, 20
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 166
LDI r7, 39
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
