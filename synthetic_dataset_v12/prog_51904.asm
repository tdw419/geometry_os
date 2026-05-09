; DESCRIPTION: Places a yellow 11x71 rectangle at position (97, 85).
; PLAN: r0=97(x), r1=85(y), r2=11(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 85
LDI r2, 11
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
