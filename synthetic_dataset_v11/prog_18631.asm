; DESCRIPTION: Places a yellow 10x66 rectangle at position (149, 90).
; PLAN: r0=149(x), r1=90(y), r2=10(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 90
LDI r2, 10
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
