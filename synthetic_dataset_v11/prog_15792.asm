; DESCRIPTION: Places a magenta 13x80 rectangle at position (42, 80).
; PLAN: r0=42(x), r1=80(y), r2=13(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 80
LDI r2, 13
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
