; DESCRIPTION: Places a blue 37x68 rectangle at position (291, 15).
; PLAN: r0=291(x), r1=15(y), r2=37(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 15
LDI r2, 37
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
