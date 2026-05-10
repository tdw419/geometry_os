; DESCRIPTION: Composite: Places a yellow line segment connecting (501, 195) to (343, 54) then Places a black dot at position (68, 177).
; PLAN: r0=501(x1), r1=195(y1), r2=343(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=177(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 501
LDI r1, 195
LDI r2, 343
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 177
LDI r7, 0x000000
PSET r5, r6, r7
HALT
