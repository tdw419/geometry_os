; DESCRIPTION: Places a magenta 25x34 rectangle at position (60, 42).
; PLAN: r0=60(x), r1=42(y), r2=25(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 42
LDI r2, 25
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
