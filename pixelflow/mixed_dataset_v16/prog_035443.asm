; DESCRIPTION: Composite: Draws a white circle centered at (205, 176) with radius 44 then Places a yellow line segment connecting (298, 120) to (302, 216).
; PLAN: r0=205(x), r1=176(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x1), r6=120(y1), r7=302(x2), r8=216(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 176
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 120
LDI r7, 302
LDI r8, 216
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
