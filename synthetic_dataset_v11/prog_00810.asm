; DESCRIPTION: Places a magenta 74x117 rectangle at position (30, 95).
; PLAN: r0=30(x), r1=95(y), r2=74(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 95
LDI r2, 74
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
