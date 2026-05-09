; DESCRIPTION: Places a black 106x26 rectangle at position (261, 219).
; PLAN: r0=261(x), r1=219(y), r2=106(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 219
LDI r2, 106
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
