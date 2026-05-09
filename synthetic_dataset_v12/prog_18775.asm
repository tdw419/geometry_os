; DESCRIPTION: Composite: Places a black dot at position (123, 34) then Places a green 78x14 rectangle at position (363, 194).
; PLAN: r0=123(x), r1=34(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=363(x), r6=194(y), r7=78(width), r8=14(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 34
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 363
LDI r6, 194
LDI r7, 78
LDI r8, 14
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
