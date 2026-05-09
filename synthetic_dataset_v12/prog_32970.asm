; DESCRIPTION: Composite: Sets a single blue pixel at (69, 117) then Places a green line segment connecting (74, 86) to (88, 35).
; PLAN: r0=69(x), r1=117(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=74(x1), r6=86(y1), r7=88(x2), r8=35(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 117
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 74
LDI r6, 86
LDI r7, 88
LDI r8, 35
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
