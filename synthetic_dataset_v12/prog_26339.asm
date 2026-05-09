; DESCRIPTION: Renders a black box of size 11x71 starting at (213, 103).
; PLAN: r0=213(x), r1=103(y), r2=11(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 103
LDI r2, 11
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
