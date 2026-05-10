; DESCRIPTION: Composite: Places a black dot at position (214, 88) then Creates a green rectangular region at (185, 13) spanning 41 by 61 pixels.
; PLAN: r0=214(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=185(x), r6=13(y), r7=41(width), r8=61(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 185
LDI r6, 13
LDI r7, 41
LDI r8, 61
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
