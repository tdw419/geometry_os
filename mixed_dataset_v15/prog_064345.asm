; DESCRIPTION: Composite: Places a orange dot at position (122, 248) then Renders a black box of size 39x37 starting at (368, 131).
; PLAN: r0=122(x), r1=248(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=131(y), r7=39(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 122
LDI r1, 248
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 368
LDI r6, 131
LDI r7, 39
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
