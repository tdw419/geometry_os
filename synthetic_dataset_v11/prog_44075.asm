; DESCRIPTION: Renders a black box of size 75x13 starting at (172, 67).
; PLAN: r0=172(x), r1=67(y), r2=75(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 67
LDI r2, 75
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
