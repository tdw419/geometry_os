; DESCRIPTION: Places a yellow 31x73 rectangle at position (423, 157).
; PLAN: r0=423(x), r1=157(y), r2=31(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 157
LDI r2, 31
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
