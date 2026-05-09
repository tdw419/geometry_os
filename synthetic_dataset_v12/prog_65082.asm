; DESCRIPTION: Renders a yellow box of size 60x31 starting at (362, 41).
; PLAN: r0=362(x), r1=41(y), r2=60(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 41
LDI r2, 60
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
