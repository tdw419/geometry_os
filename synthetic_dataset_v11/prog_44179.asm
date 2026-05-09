; DESCRIPTION: Renders a white box of size 39x116 starting at (112, 72).
; PLAN: r0=112(x), r1=72(y), r2=39(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 72
LDI r2, 39
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
