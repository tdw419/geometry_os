; DESCRIPTION: Renders a purple box of size 41x67 starting at (10, 134).
; PLAN: r0=10(x), r1=134(y), r2=41(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 134
LDI r2, 41
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
