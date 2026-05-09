; DESCRIPTION: Composite: Places a white 89x92 rectangle at position (77, 133) then Places a black dot at position (432, 141).
; PLAN: r0=77(x), r1=133(y), r2=89(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=141(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 133
LDI r2, 89
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 141
LDI r7, 0x000000
PSET r5, r6, r7
HALT
