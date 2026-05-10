; DESCRIPTION: Renders a yellow rectangular region spanning 63 by 117 at (276, 41).
; PLAN: r0=276(x), r1=41(y), r2=63(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 41
LDI r2, 63
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
