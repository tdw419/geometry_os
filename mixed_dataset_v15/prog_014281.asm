; DESCRIPTION: Places a black 77x22 rectangle at position (119, 202).
; PLAN: r0=119(x), r1=202(y), r2=77(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 202
LDI r2, 77
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
