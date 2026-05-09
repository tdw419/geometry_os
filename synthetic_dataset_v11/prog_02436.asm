; DESCRIPTION: Places a yellow 97x58 rectangle at position (38, 65).
; PLAN: r0=38(x), r1=65(y), r2=97(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 65
LDI r2, 97
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
