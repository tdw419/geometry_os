; DESCRIPTION: Renders a black box of size 67x89 starting at (169, 28).
; PLAN: r0=169(x), r1=28(y), r2=67(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 28
LDI r2, 67
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
