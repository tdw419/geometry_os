; DESCRIPTION: Renders a black box of size 11x65 starting at (245, 186).
; PLAN: r0=245(x), r1=186(y), r2=11(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 186
LDI r2, 11
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
