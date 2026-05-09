; DESCRIPTION: Renders a red box of size 116x58 starting at (91, 117).
; PLAN: r0=91(x), r1=117(y), r2=116(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 117
LDI r2, 116
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
