; DESCRIPTION: Places a black 115x10 rectangle at position (104, 14).
; PLAN: r0=104(x), r1=14(y), r2=115(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 14
LDI r2, 115
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
