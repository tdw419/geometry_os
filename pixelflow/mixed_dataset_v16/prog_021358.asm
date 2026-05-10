; DESCRIPTION: Composite: Places a black dot at position (186, 232) then Renders a red box of size 35x27 starting at (42, 208).
; PLAN: r0=186(x), r1=232(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=42(x), r6=208(y), r7=35(width), r8=27(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 232
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 42
LDI r6, 208
LDI r7, 35
LDI r8, 27
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
