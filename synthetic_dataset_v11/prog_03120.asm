; DESCRIPTION: Renders a green box of size 106x55 starting at (28, 22).
; PLAN: r0=28(x), r1=22(y), r2=106(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 22
LDI r2, 106
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
