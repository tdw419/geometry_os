; DESCRIPTION: Places a green 54x88 rectangle at position (278, 138).
; PLAN: r0=278(x), r1=138(y), r2=54(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 138
LDI r2, 54
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
