; DESCRIPTION: Renders a black box of size 37x40 starting at (208, 52).
; PLAN: r0=208(x), r1=52(y), r2=37(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 52
LDI r2, 37
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
