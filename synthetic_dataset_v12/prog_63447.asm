; DESCRIPTION: Places a black 13x97 rectangle at position (226, 20).
; PLAN: r0=226(x), r1=20(y), r2=13(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 20
LDI r2, 13
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
