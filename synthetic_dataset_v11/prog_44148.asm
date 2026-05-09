; DESCRIPTION: Places a magenta 13x120 rectangle at position (101, 68).
; PLAN: r0=101(x), r1=68(y), r2=13(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 68
LDI r2, 13
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
