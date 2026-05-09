; DESCRIPTION: Renders a red box of size 95x21 starting at (99, 29).
; PLAN: r0=99(x), r1=29(y), r2=95(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 29
LDI r2, 95
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
