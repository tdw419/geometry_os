; DESCRIPTION: Renders a red box of size 28x78 starting at (305, 119).
; PLAN: r0=305(x), r1=119(y), r2=28(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 119
LDI r2, 28
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
