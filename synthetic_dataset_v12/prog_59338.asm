; DESCRIPTION: Renders a black box of size 114x27 starting at (204, 170).
; PLAN: r0=204(x), r1=170(y), r2=114(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 170
LDI r2, 114
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
