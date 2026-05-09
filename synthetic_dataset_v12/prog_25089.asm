; DESCRIPTION: Renders a red box of size 70x52 starting at (416, 14).
; PLAN: r0=416(x), r1=14(y), r2=70(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 14
LDI r2, 70
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
