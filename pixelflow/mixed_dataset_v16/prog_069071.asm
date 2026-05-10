; DESCRIPTION: Renders a red box of size 34x71 starting at (235, 129).
; PLAN: r0=235(x), r1=129(y), r2=34(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 129
LDI r2, 34
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
