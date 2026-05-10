; DESCRIPTION: Places a yellow 36x76 box at position (107, 35).
; PLAN: r0=107(x), r1=35(y), r2=36(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 35
LDI r2, 36
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
