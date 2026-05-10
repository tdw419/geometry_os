; DESCRIPTION: Renders a yellow rectangular region spanning 63 by 41 at (327, 75).
; PLAN: r0=327(x), r1=75(y), r2=63(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 75
LDI r2, 63
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
