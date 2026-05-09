; DESCRIPTION: Renders a red box of size 95x33 starting at (65, 59).
; PLAN: r0=65(x), r1=59(y), r2=95(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 59
LDI r2, 95
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
