; DESCRIPTION: Places a magenta 74x29 rectangle at position (176, 127).
; PLAN: r0=176(x), r1=127(y), r2=74(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 127
LDI r2, 74
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
