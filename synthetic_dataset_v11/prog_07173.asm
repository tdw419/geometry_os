; DESCRIPTION: Places a green 99x116 rectangle at position (149, 2).
; PLAN: r0=149(x), r1=2(y), r2=99(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 2
LDI r2, 99
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
