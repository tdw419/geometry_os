; DESCRIPTION: Renders a red box of size 68x59 starting at (65, 145).
; PLAN: r0=65(x), r1=145(y), r2=68(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 145
LDI r2, 68
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
