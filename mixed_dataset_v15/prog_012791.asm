; DESCRIPTION: Composite: Places a black dot at position (260, 78) then Renders a black box of size 51x13 starting at (255, 125).
; PLAN: r0=260(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=125(y), r7=51(width), r8=13(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 255
LDI r6, 125
LDI r7, 51
LDI r8, 13
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
