; DESCRIPTION: Renders a black box of size 36x98 starting at (133, 67).
; PLAN: r0=133(x), r1=67(y), r2=36(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 67
LDI r2, 36
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
