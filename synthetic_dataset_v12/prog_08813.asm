; DESCRIPTION: Renders a red box of size 88x88 starting at (208, 117).
; PLAN: r0=208(x), r1=117(y), r2=88(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 117
LDI r2, 88
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
