; DESCRIPTION: Renders a black box of size 84x112 starting at (143, 0).
; PLAN: r0=143(x), r1=0(y), r2=84(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 0
LDI r2, 84
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
