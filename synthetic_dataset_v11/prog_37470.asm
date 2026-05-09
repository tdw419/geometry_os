; DESCRIPTION: Places a blue 34x54 rectangle at position (138, 22).
; PLAN: r0=138(x), r1=22(y), r2=34(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 22
LDI r2, 34
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
