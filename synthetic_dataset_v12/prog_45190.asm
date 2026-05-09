; DESCRIPTION: Places a black 71x67 rectangle at position (110, 189).
; PLAN: r0=110(x), r1=189(y), r2=71(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 189
LDI r2, 71
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
