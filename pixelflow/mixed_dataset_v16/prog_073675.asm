; DESCRIPTION: Composite: Places a black dot at position (193, 163) then Creates a cyan rectangular region at (369, 174) spanning 41 by 63 pixels.
; PLAN: r0=193(x), r1=163(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=174(y), r7=41(width), r8=63(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 163
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 369
LDI r6, 174
LDI r7, 41
LDI r8, 63
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
