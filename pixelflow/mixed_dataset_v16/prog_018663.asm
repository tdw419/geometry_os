; DESCRIPTION: Renders a red box of size 106x40 starting at (73, 39).
; PLAN: r0=73(x), r1=39(y), r2=106(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 39
LDI r2, 106
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
