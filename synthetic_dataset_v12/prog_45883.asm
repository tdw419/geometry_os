; DESCRIPTION: Renders a red box of size 101x112 starting at (294, 97).
; PLAN: r0=294(x), r1=97(y), r2=101(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 97
LDI r2, 101
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
