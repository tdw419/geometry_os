; DESCRIPTION: Places a magenta 12x96 rectangle at position (212, 114).
; PLAN: r0=212(x), r1=114(y), r2=12(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 114
LDI r2, 12
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
