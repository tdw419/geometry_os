; DESCRIPTION: Composite: Places a blue 118x68 rectangle at position (167, 127) then Sets a single magenta pixel at (143, 158).
; PLAN: r0=167(x), r1=127(y), r2=118(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=158(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 127
LDI r2, 118
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 158
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
