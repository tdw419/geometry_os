; DESCRIPTION: Renders a blue box of size 24x41 starting at (190, 13).
; PLAN: r0=190(x), r1=13(y), r2=24(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 13
LDI r2, 24
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
