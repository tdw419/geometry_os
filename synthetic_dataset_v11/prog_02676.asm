; DESCRIPTION: Renders a red box of size 28x77 starting at (30, 48).
; PLAN: r0=30(x), r1=48(y), r2=28(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 48
LDI r2, 28
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
