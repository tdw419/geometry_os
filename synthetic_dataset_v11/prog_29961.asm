; DESCRIPTION: Places a blue 100x42 rectangle at position (25, 119).
; PLAN: r0=25(x), r1=119(y), r2=100(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 119
LDI r2, 100
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
