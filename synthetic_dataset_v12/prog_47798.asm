; DESCRIPTION: Renders a black box of size 34x49 starting at (195, 36).
; PLAN: r0=195(x), r1=36(y), r2=34(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 36
LDI r2, 34
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
