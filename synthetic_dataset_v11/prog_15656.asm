; DESCRIPTION: Places a magenta 95x10 rectangle at position (8, 127).
; PLAN: r0=8(x), r1=127(y), r2=95(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 127
LDI r2, 95
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
