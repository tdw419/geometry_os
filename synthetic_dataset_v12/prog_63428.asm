; DESCRIPTION: Places a magenta 70x39 rectangle at position (81, 42).
; PLAN: r0=81(x), r1=42(y), r2=70(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 42
LDI r2, 70
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
