; DESCRIPTION: Places a black 95x117 rectangle at position (30, 114).
; PLAN: r0=30(x), r1=114(y), r2=95(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 114
LDI r2, 95
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
