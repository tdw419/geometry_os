; DESCRIPTION: Places a magenta 101x60 rectangle at position (59, 42).
; PLAN: r0=59(x), r1=42(y), r2=101(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 42
LDI r2, 101
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
