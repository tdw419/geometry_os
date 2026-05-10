; DESCRIPTION: Places a yellow 31x25 rectangle at position (249, 66).
; PLAN: r0=249(x), r1=66(y), r2=31(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 66
LDI r2, 31
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
