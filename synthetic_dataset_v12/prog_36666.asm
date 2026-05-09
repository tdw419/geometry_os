; DESCRIPTION: Renders a purple box of size 47x15 starting at (361, 41).
; PLAN: r0=361(x), r1=41(y), r2=47(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 41
LDI r2, 47
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
