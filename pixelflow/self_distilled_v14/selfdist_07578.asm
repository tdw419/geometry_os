; DESCRIPTION: Renders a green rectangular region spanning 95 by 35 at (395, 29).
; PLAN: r0=395(x), r1=29(y), r2=95(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 29
LDI r2, 95
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
