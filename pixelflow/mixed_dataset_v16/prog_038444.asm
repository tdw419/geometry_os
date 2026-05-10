; DESCRIPTION: Renders a black box of size 67x109 starting at (126, 85).
; PLAN: r0=126(x), r1=85(y), r2=67(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 85
LDI r2, 67
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
