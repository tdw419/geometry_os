; DESCRIPTION: Places a blue 13x26 rectangle at position (312, 178).
; PLAN: r0=312(x), r1=178(y), r2=13(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 178
LDI r2, 13
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
