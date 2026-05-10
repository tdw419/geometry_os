; DESCRIPTION: Renders a red box of size 82x34 starting at (80, 70).
; PLAN: r0=80(x), r1=70(y), r2=82(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 70
LDI r2, 82
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
