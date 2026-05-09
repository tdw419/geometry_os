; DESCRIPTION: Composite: Places a black dot at position (331, 155) then Renders a white box of size 34x102 starting at (251, 53).
; PLAN: r0=331(x), r1=155(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=53(y), r7=34(width), r8=102(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 331
LDI r1, 155
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 251
LDI r6, 53
LDI r7, 34
LDI r8, 102
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
