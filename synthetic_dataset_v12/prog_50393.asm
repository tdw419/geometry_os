; DESCRIPTION: Renders a red box of size 96x120 starting at (142, 11).
; PLAN: r0=142(x), r1=11(y), r2=96(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 11
LDI r2, 96
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
