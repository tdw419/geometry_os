; DESCRIPTION: Renders a red box of size 58x100 starting at (319, 65).
; PLAN: r0=319(x), r1=65(y), r2=58(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 65
LDI r2, 58
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
