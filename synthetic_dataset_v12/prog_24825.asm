; DESCRIPTION: Places a black 97x88 rectangle at position (193, 163).
; PLAN: r0=193(x), r1=163(y), r2=97(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 163
LDI r2, 97
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
