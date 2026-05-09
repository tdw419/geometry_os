; DESCRIPTION: Places a green 37x88 rectangle at position (101, 165).
; PLAN: r0=101(x), r1=165(y), r2=37(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 165
LDI r2, 37
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
