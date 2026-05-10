; DESCRIPTION: Renders a red box of size 17x92 starting at (116, 117).
; PLAN: r0=116(x), r1=117(y), r2=17(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 117
LDI r2, 17
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
