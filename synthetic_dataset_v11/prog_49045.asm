; DESCRIPTION: Places a yellow 101x13 rectangle at position (20, 23).
; PLAN: r0=20(x), r1=23(y), r2=101(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 23
LDI r2, 101
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
