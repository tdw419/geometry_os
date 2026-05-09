; DESCRIPTION: Renders a purple box of size 46x67 starting at (169, 187).
; PLAN: r0=169(x), r1=187(y), r2=46(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 187
LDI r2, 46
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
