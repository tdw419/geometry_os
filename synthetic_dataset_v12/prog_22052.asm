; DESCRIPTION: Composite: Places a cyan line segment connecting (286, 33) to (228, 181) then Places a black dot at position (192, 97).
; PLAN: r0=286(x1), r1=33(y1), r2=228(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=97(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 33
LDI r2, 228
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 97
LDI r7, 0x000000
PSET r5, r6, r7
HALT
