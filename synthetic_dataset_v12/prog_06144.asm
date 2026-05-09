; DESCRIPTION: Places a yellow 114x101 rectangle at position (288, 9).
; PLAN: r0=288(x), r1=9(y), r2=114(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 9
LDI r2, 114
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
