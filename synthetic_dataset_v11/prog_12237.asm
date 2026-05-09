; DESCRIPTION: Places a blue 85x93 rectangle at position (154, 123).
; PLAN: r0=154(x), r1=123(y), r2=85(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 123
LDI r2, 85
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
