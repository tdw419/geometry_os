; DESCRIPTION: Renders a purple box of size 26x116 starting at (96, 107).
; PLAN: r0=96(x), r1=107(y), r2=26(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 107
LDI r2, 26
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
