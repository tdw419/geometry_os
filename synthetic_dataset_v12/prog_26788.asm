; DESCRIPTION: Composite: Places a cyan 44x114 rectangle at position (189, 83) then Places a white dot at position (432, 61).
; PLAN: r0=189(x), r1=83(y), r2=44(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=61(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 189
LDI r1, 83
LDI r2, 44
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 61
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
