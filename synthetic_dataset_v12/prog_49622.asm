; DESCRIPTION: Composite: Renders a green disk with center (352, 140) and radius 56 then Places a yellow line segment connecting (225, 86) to (502, 243).
; PLAN: r0=352(x), r1=140(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x1), r6=86(y1), r7=502(x2), r8=243(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 140
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 86
LDI r7, 502
LDI r8, 243
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
