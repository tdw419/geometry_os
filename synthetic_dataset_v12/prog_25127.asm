; DESCRIPTION: Renders a red box of size 77x116 starting at (342, 13).
; PLAN: r0=342(x), r1=13(y), r2=77(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 13
LDI r2, 77
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
