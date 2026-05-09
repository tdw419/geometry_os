; DESCRIPTION: Renders a green box of size 34x66 starting at (219, 55).
; PLAN: r0=219(x), r1=55(y), r2=34(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 55
LDI r2, 34
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
