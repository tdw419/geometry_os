; DESCRIPTION: Renders a red box of size 44x54 starting at (70, 119).
; PLAN: r0=70(x), r1=119(y), r2=44(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 119
LDI r2, 44
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
