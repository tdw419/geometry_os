; DESCRIPTION: Places a black 70x30 rectangle at position (14, 130).
; PLAN: r0=14(x), r1=130(y), r2=70(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 130
LDI r2, 70
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
