; DESCRIPTION: Composite: Places a purple dot at position (193, 228) then Renders a blue box of size 68x13 starting at (102, 148).
; PLAN: r0=193(x), r1=228(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=148(y), r7=68(width), r8=13(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 193
LDI r1, 228
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 102
LDI r6, 148
LDI r7, 68
LDI r8, 13
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
