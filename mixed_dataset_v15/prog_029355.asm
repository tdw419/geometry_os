; DESCRIPTION: Renders a red box of size 77x72 starting at (352, 18).
; PLAN: r0=352(x), r1=18(y), r2=77(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 18
LDI r2, 77
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
