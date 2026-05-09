; DESCRIPTION: Places a black 90x66 rectangle at position (182, 13).
; PLAN: r0=182(x), r1=13(y), r2=90(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 13
LDI r2, 90
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
