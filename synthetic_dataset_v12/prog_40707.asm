; DESCRIPTION: Places a magenta 101x74 rectangle at position (79, 70).
; PLAN: r0=79(x), r1=70(y), r2=101(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 70
LDI r2, 101
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
