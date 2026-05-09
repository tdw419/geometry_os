; DESCRIPTION: Places a yellow 81x73 rectangle at position (31, 13).
; PLAN: r0=31(x), r1=13(y), r2=81(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 13
LDI r2, 81
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
