; DESCRIPTION: Renders a red box of size 80x99 starting at (347, 134).
; PLAN: r0=347(x), r1=134(y), r2=80(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 134
LDI r2, 80
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
