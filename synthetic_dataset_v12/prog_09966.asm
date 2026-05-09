; DESCRIPTION: Places a green 67x101 rectangle at position (45, 110).
; PLAN: r0=45(x), r1=110(y), r2=67(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 110
LDI r2, 67
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
