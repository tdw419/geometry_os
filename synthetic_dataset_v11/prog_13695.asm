; DESCRIPTION: Places a black 19x60 rectangle at position (117, 71).
; PLAN: r0=117(x), r1=71(y), r2=19(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 71
LDI r2, 19
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
