; DESCRIPTION: Renders a yellow box of size 90x95 starting at (147, 67).
; PLAN: r0=147(x), r1=67(y), r2=90(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 67
LDI r2, 90
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
