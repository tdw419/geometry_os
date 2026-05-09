; DESCRIPTION: Renders a black box of size 16x37 starting at (247, 67).
; PLAN: r0=247(x), r1=67(y), r2=16(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 67
LDI r2, 16
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
