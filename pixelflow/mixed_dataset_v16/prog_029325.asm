; DESCRIPTION: Renders a black box of size 33x116 starting at (160, 0).
; PLAN: r0=160(x), r1=0(y), r2=33(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 0
LDI r2, 33
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
