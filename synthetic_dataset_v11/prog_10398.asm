; DESCRIPTION: Renders a red box of size 81x95 starting at (136, 144).
; PLAN: r0=136(x), r1=144(y), r2=81(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 144
LDI r2, 81
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
