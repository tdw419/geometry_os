; DESCRIPTION: Renders a purple box of size 111x77 starting at (285, 41).
; PLAN: r0=285(x), r1=41(y), r2=111(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 41
LDI r2, 111
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
