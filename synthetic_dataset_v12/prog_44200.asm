; DESCRIPTION: Places a yellow 19x99 rectangle at position (193, 101).
; PLAN: r0=193(x), r1=101(y), r2=19(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 101
LDI r2, 19
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
