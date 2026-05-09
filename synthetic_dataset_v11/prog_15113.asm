; DESCRIPTION: Renders a red box of size 56x100 starting at (43, 156).
; PLAN: r0=43(x), r1=156(y), r2=56(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 156
LDI r2, 56
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
