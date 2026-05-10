; DESCRIPTION: Places a yellow 95x31 box at position (35, 157).
; PLAN: r0=35(x), r1=157(y), r2=95(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 157
LDI r2, 95
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
