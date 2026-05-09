; DESCRIPTION: Places a magenta 116x96 rectangle at position (111, 24).
; PLAN: r0=111(x), r1=24(y), r2=116(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 24
LDI r2, 116
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
