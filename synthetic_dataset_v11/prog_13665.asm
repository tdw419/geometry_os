; DESCRIPTION: Renders a red box of size 101x73 starting at (30, 83).
; PLAN: r0=30(x), r1=83(y), r2=101(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 83
LDI r2, 101
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
