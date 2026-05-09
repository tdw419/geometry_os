; DESCRIPTION: Places a magenta 115x96 rectangle at position (337, 64).
; PLAN: r0=337(x), r1=64(y), r2=115(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 64
LDI r2, 115
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
