; DESCRIPTION: Places a yellow 114x112 rectangle at position (84, 76).
; PLAN: r0=84(x), r1=76(y), r2=114(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 76
LDI r2, 114
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
