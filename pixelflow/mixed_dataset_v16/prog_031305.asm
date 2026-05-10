; DESCRIPTION: Composite: Places a blue dot at position (132, 158) then Renders a magenta box of size 25x93 starting at (191, 114).
; PLAN: r0=132(x), r1=158(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=114(y), r7=25(width), r8=93(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 132
LDI r1, 158
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 191
LDI r6, 114
LDI r7, 25
LDI r8, 93
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
