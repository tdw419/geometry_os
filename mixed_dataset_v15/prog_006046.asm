; DESCRIPTION: Renders a black box of size 22x49 starting at (208, 171).
; PLAN: r0=208(x), r1=171(y), r2=22(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 171
LDI r2, 22
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
