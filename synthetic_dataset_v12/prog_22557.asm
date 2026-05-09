; DESCRIPTION: Renders a black box of size 107x60 starting at (61, 155).
; PLAN: r0=61(x), r1=155(y), r2=107(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 155
LDI r2, 107
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
