; DESCRIPTION: Renders a red box of size 79x20 starting at (47, 36).
; PLAN: r0=47(x), r1=36(y), r2=79(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 36
LDI r2, 79
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
