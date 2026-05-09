; DESCRIPTION: Places a black 95x114 rectangle at position (4, 86).
; PLAN: r0=4(x), r1=86(y), r2=95(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 86
LDI r2, 95
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
