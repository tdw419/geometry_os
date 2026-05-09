; DESCRIPTION: Renders a red box of size 70x55 starting at (14, 90).
; PLAN: r0=14(x), r1=90(y), r2=70(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 90
LDI r2, 70
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
