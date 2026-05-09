; DESCRIPTION: Renders a green box of size 41x92 starting at (297, 122).
; PLAN: r0=297(x), r1=122(y), r2=41(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 122
LDI r2, 41
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
