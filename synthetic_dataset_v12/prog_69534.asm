; DESCRIPTION: Composite: Places a orange line segment connecting (351, 202) to (161, 210) then Places a blue dot at position (176, 71).
; PLAN: r0=351(x1), r1=202(y1), r2=161(x2), r3=210(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=176(x), r6=71(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 351
LDI r1, 202
LDI r2, 161
LDI r3, 210
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 71
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
