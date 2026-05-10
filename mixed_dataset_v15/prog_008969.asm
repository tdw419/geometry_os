; DESCRIPTION: Renders a blue box of size 108x46 starting at (67, 168).
; PLAN: r0=67(x), r1=168(y), r2=108(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 168
LDI r2, 108
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
