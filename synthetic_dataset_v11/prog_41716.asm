; DESCRIPTION: Renders a black box of size 34x112 starting at (160, 73).
; PLAN: r0=160(x), r1=73(y), r2=34(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 73
LDI r2, 34
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
