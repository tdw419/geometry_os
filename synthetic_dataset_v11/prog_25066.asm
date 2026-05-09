; DESCRIPTION: Renders a red box of size 61x100 starting at (181, 130).
; PLAN: r0=181(x), r1=130(y), r2=61(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 130
LDI r2, 61
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
