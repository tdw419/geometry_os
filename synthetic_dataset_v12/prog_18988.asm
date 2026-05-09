; DESCRIPTION: Renders a red box of size 46x110 starting at (137, 97).
; PLAN: r0=137(x), r1=97(y), r2=46(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 97
LDI r2, 46
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
