; DESCRIPTION: Places a black 54x71 rectangle at position (179, 119).
; PLAN: r0=179(x), r1=119(y), r2=54(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 119
LDI r2, 54
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
