; DESCRIPTION: Renders a green box of size 29x99 starting at (357, 38).
; PLAN: r0=357(x), r1=38(y), r2=29(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 38
LDI r2, 29
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
