; DESCRIPTION: Places a black 77x13 rectangle at position (249, 83).
; PLAN: r0=249(x), r1=83(y), r2=77(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 83
LDI r2, 77
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
