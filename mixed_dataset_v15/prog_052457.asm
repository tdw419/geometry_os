; DESCRIPTION: Places a black 86x22 rectangle at position (40, 158).
; PLAN: r0=40(x), r1=158(y), r2=86(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 158
LDI r2, 86
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
