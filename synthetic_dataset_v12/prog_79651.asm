; DESCRIPTION: Renders a red box of size 92x18 starting at (319, 97).
; PLAN: r0=319(x), r1=97(y), r2=92(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 97
LDI r2, 92
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
