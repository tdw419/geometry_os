; DESCRIPTION: Renders a black box of size 117x95 starting at (389, 107).
; PLAN: r0=389(x), r1=107(y), r2=117(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 107
LDI r2, 117
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
