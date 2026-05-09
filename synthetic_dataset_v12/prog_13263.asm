; DESCRIPTION: Renders a red box of size 112x65 starting at (61, 114).
; PLAN: r0=61(x), r1=114(y), r2=112(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 114
LDI r2, 112
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
