; DESCRIPTION: Renders a blue box of size 48x107 starting at (67, 36).
; PLAN: r0=67(x), r1=36(y), r2=48(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 36
LDI r2, 48
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
