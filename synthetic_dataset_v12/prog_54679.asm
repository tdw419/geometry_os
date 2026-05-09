; DESCRIPTION: Composite: Places a orange line segment connecting (113, 119) to (294, 111) then Renders a blue disk with center (345, 174) and radius 33.
; PLAN: r0=113(x1), r1=119(y1), r2=294(x2), r3=111(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=174(y), r7=33(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 119
LDI r2, 294
LDI r3, 111
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 174
LDI r7, 33
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
