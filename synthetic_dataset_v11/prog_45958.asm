; DESCRIPTION: Renders a red box of size 29x75 starting at (125, 34).
; PLAN: r0=125(x), r1=34(y), r2=29(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 34
LDI r2, 29
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
