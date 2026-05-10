; DESCRIPTION: Renders a red box of size 77x12 starting at (240, 219).
; PLAN: r0=240(x), r1=219(y), r2=77(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 219
LDI r2, 77
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
