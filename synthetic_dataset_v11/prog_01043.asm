; DESCRIPTION: Places a magenta 96x93 rectangle at position (137, 156).
; PLAN: r0=137(x), r1=156(y), r2=96(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 156
LDI r2, 96
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
