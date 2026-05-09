; DESCRIPTION: Places a green 99x119 rectangle at position (149, 46).
; PLAN: r0=149(x), r1=46(y), r2=99(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 46
LDI r2, 99
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
