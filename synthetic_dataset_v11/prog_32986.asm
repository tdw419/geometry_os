; DESCRIPTION: Renders a red box of size 99x92 starting at (66, 65).
; PLAN: r0=66(x), r1=65(y), r2=99(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 65
LDI r2, 99
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
