; DESCRIPTION: Places a yellow 25x119 rectangle at position (291, 1).
; PLAN: r0=291(x), r1=1(y), r2=25(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 1
LDI r2, 25
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
