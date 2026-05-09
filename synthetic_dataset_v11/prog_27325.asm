; DESCRIPTION: Renders a red box of size 112x99 starting at (45, 40).
; PLAN: r0=45(x), r1=40(y), r2=112(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 40
LDI r2, 112
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
