; DESCRIPTION: Renders a green rectangular region spanning 14 by 41 at (275, 11).
; PLAN: r0=275(x), r1=11(y), r2=14(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 11
LDI r2, 14
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
