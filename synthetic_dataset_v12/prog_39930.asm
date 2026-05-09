; DESCRIPTION: Places a yellow 97x112 rectangle at position (97, 25).
; PLAN: r0=97(x), r1=25(y), r2=97(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 25
LDI r2, 97
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
