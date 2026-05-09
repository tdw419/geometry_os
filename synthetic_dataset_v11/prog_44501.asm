; DESCRIPTION: Places a yellow 35x56 rectangle at position (117, 100).
; PLAN: r0=117(x), r1=100(y), r2=35(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 100
LDI r2, 35
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
