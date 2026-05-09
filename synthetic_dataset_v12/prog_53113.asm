; DESCRIPTION: Places a magenta 25x68 rectangle at position (60, 157).
; PLAN: r0=60(x), r1=157(y), r2=25(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 157
LDI r2, 25
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
