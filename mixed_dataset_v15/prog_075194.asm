; DESCRIPTION: Places a black 68x96 rectangle at position (411, 83).
; PLAN: r0=411(x), r1=83(y), r2=68(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 83
LDI r2, 68
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
