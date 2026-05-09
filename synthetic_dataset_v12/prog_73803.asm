; DESCRIPTION: Renders a purple box of size 83x41 starting at (167, 45).
; PLAN: r0=167(x), r1=45(y), r2=83(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 45
LDI r2, 83
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
