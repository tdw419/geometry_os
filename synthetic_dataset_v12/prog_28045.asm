; DESCRIPTION: Renders a red box of size 93x55 starting at (22, 57).
; PLAN: r0=22(x), r1=57(y), r2=93(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 57
LDI r2, 93
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
