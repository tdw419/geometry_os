; DESCRIPTION: Places a magenta 52x42 rectangle at position (200, 13).
; PLAN: r0=200(x), r1=13(y), r2=52(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 13
LDI r2, 52
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
