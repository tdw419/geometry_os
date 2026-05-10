; DESCRIPTION: Composite: Places a blue dot at position (442, 229) then Renders a purple box of size 73x27 starting at (246, 226).
; PLAN: r0=442(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=226(y), r7=73(width), r8=27(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 226
LDI r7, 73
LDI r8, 27
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
