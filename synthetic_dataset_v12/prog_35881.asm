; DESCRIPTION: Places a black 109x34 rectangle at position (172, 207).
; PLAN: r0=172(x), r1=207(y), r2=109(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 207
LDI r2, 109
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
