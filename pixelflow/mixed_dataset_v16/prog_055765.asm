; DESCRIPTION: Composite: Places a purple dot at position (388, 248) then Places a blue 60x31 rectangle at position (65, 168).
; PLAN: r0=388(x), r1=248(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=65(x), r6=168(y), r7=60(width), r8=31(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 248
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 65
LDI r6, 168
LDI r7, 60
LDI r8, 31
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
