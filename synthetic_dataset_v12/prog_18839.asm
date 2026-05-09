; DESCRIPTION: Renders a black box of size 34x12 starting at (71, 195).
; PLAN: r0=71(x), r1=195(y), r2=34(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 195
LDI r2, 34
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
