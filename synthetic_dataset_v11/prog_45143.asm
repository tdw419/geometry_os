; DESCRIPTION: Places a magenta 114x90 rectangle at position (95, 32).
; PLAN: r0=95(x), r1=32(y), r2=114(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 32
LDI r2, 114
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
