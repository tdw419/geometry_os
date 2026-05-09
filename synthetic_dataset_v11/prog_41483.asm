; DESCRIPTION: Places a yellow 85x112 rectangle at position (99, 9).
; PLAN: r0=99(x), r1=9(y), r2=85(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 9
LDI r2, 85
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
