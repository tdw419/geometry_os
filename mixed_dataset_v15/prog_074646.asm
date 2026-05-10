; DESCRIPTION: Composite: Places a green line segment connecting (329, 101) to (150, 229) then Places a black dot at position (297, 128).
; PLAN: r0=329(x1), r1=101(y1), r2=150(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=128(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 329
LDI r1, 101
LDI r2, 150
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 128
LDI r7, 0x000000
PSET r5, r6, r7
HALT
