; DESCRIPTION: Places a black 74x66 rectangle at position (143, 8).
; PLAN: r0=143(x), r1=8(y), r2=74(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 8
LDI r2, 74
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
