; DESCRIPTION: Places a yellow 77x92 rectangle at position (396, 97).
; PLAN: r0=396(x), r1=97(y), r2=77(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 97
LDI r2, 77
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
