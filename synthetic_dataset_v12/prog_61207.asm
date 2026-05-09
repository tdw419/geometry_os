; DESCRIPTION: Renders a red box of size 35x11 starting at (250, 243).
; PLAN: r0=250(x), r1=243(y), r2=35(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 243
LDI r2, 35
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
