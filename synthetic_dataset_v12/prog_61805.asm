; DESCRIPTION: Places a yellow 66x95 rectangle at position (99, 99).
; PLAN: r0=99(x), r1=99(y), r2=66(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 99
LDI r2, 66
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
