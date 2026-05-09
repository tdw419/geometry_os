; DESCRIPTION: Renders a red box of size 110x105 starting at (288, 46).
; PLAN: r0=288(x), r1=46(y), r2=110(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 46
LDI r2, 110
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
