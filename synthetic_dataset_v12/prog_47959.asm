; DESCRIPTION: Places a blue 84x101 rectangle at position (214, 68).
; PLAN: r0=214(x), r1=68(y), r2=84(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 68
LDI r2, 84
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
