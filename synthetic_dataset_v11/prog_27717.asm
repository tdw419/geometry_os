; DESCRIPTION: Places a magenta 75x116 rectangle at position (8, 127).
; PLAN: r0=8(x), r1=127(y), r2=75(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 127
LDI r2, 75
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
