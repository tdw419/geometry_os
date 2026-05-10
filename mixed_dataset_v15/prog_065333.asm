; DESCRIPTION: Renders a red box of size 77x105 starting at (100, 103).
; PLAN: r0=100(x), r1=103(y), r2=77(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 103
LDI r2, 77
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
