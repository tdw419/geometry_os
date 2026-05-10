; DESCRIPTION: Places a black 19x92 rectangle at position (197, 97).
; PLAN: r0=197(x), r1=97(y), r2=19(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 97
LDI r2, 19
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
