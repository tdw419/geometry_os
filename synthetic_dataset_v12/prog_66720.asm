; DESCRIPTION: Renders a yellow box of size 76x46 starting at (360, 99).
; PLAN: r0=360(x), r1=99(y), r2=76(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 99
LDI r2, 76
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
