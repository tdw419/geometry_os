; DESCRIPTION: Renders a black box of size 108x72 starting at (245, 25).
; PLAN: r0=245(x), r1=25(y), r2=108(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 25
LDI r2, 108
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
