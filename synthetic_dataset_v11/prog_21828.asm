; DESCRIPTION: Places a yellow 105x34 rectangle at position (13, 79).
; PLAN: r0=13(x), r1=79(y), r2=105(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 79
LDI r2, 105
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
