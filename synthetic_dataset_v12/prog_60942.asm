; DESCRIPTION: Renders a red box of size 108x106 starting at (48, 29).
; PLAN: r0=48(x), r1=29(y), r2=108(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 29
LDI r2, 108
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
