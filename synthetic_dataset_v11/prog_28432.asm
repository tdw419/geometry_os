; DESCRIPTION: Renders a purple box of size 94x38 starting at (41, 200).
; PLAN: r0=41(x), r1=200(y), r2=94(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 200
LDI r2, 94
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
