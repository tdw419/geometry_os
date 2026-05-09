; DESCRIPTION: Places a yellow 79x114 rectangle at position (244, 99).
; PLAN: r0=244(x), r1=99(y), r2=79(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 99
LDI r2, 79
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
