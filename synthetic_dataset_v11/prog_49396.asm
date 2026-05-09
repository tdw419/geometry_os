; DESCRIPTION: Renders a red box of size 93x36 starting at (123, 55).
; PLAN: r0=123(x), r1=55(y), r2=93(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 55
LDI r2, 93
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
