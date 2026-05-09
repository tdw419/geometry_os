; DESCRIPTION: Renders a red box of size 34x70 starting at (463, 70).
; PLAN: r0=463(x), r1=70(y), r2=34(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 70
LDI r2, 34
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
