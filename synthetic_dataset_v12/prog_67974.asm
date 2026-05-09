; DESCRIPTION: Renders a blue box of size 90x38 starting at (274, 41).
; PLAN: r0=274(x), r1=41(y), r2=90(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 41
LDI r2, 90
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
