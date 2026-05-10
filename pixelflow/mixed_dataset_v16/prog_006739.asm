; DESCRIPTION: Composite: Places a black dot at position (125, 37) then Creates a green rectangular region at (11, 109) spanning 42 by 117 pixels.
; PLAN: r0=125(x), r1=37(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=11(x), r6=109(y), r7=42(width), r8=117(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 37
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 11
LDI r6, 109
LDI r7, 42
LDI r8, 117
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
