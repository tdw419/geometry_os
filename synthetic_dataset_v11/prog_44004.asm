; DESCRIPTION: Renders a black box of size 23x113 starting at (208, 122).
; PLAN: r0=208(x), r1=122(y), r2=23(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 122
LDI r2, 23
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
