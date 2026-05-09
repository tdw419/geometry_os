; DESCRIPTION: Composite: Places a white dot at position (485, 24) then Creates a black rectangular region at (258, 176) spanning 20 by 74 pixels.
; PLAN: r0=485(x), r1=24(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=176(y), r7=20(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 485
LDI r1, 24
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 258
LDI r6, 176
LDI r7, 20
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
