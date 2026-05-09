; DESCRIPTION: Renders a red box of size 12x100 starting at (250, 149).
; PLAN: r0=250(x), r1=149(y), r2=12(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 149
LDI r2, 12
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
