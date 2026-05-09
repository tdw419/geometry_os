; DESCRIPTION: Renders a red box of size 77x92 starting at (164, 16).
; PLAN: r0=164(x), r1=16(y), r2=77(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 16
LDI r2, 77
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
