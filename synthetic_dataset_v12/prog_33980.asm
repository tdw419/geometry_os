; DESCRIPTION: Renders a red box of size 29x109 starting at (253, 97).
; PLAN: r0=253(x), r1=97(y), r2=29(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 97
LDI r2, 29
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
