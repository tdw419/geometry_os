; DESCRIPTION: Renders a purple box of size 35x61 starting at (391, 41).
; PLAN: r0=391(x), r1=41(y), r2=35(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 41
LDI r2, 35
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
