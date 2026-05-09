; DESCRIPTION: Renders a red box of size 89x99 starting at (209, 2).
; PLAN: r0=209(x), r1=2(y), r2=89(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 2
LDI r2, 89
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
