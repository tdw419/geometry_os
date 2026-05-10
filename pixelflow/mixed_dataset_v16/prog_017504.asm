; DESCRIPTION: Renders a black box of size 11x112 starting at (271, 27).
; PLAN: r0=271(x), r1=27(y), r2=11(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 27
LDI r2, 11
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
