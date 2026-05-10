; DESCRIPTION: Places a black 22x104 rectangle at position (309, 22).
; PLAN: r0=309(x), r1=22(y), r2=22(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 22
LDI r2, 22
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
