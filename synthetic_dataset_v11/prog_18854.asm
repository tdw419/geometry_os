; DESCRIPTION: Renders a red box of size 24x21 starting at (4, 110).
; PLAN: r0=4(x), r1=110(y), r2=24(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 110
LDI r2, 24
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
