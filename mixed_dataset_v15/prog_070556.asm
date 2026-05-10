; DESCRIPTION: Composite: Places a black dot at position (164, 212) then Places a blue line segment connecting (101, 62) to (422, 3).
; PLAN: r0=164(x), r1=212(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=101(x1), r6=62(y1), r7=422(x2), r8=3(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 212
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 101
LDI r6, 62
LDI r7, 422
LDI r8, 3
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
