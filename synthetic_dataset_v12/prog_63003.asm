; DESCRIPTION: Composite: Sets a single yellow pixel at (99, 26) then Places a black 113x70 rectangle at position (133, 2).
; PLAN: r0=99(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=2(y), r7=113(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 133
LDI r6, 2
LDI r7, 113
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
