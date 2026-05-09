; DESCRIPTION: Renders a red box of size 43x84 starting at (393, 28).
; PLAN: r0=393(x), r1=28(y), r2=43(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 28
LDI r2, 43
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
