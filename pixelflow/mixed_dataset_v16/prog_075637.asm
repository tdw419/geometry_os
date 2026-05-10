; DESCRIPTION: Renders a red box of size 17x95 starting at (243, 114).
; PLAN: r0=243(x), r1=114(y), r2=17(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 114
LDI r2, 17
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
