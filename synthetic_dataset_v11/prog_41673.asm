; DESCRIPTION: Renders a green box of size 28x18 starting at (81, 78).
; PLAN: r0=81(x), r1=78(y), r2=28(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 78
LDI r2, 28
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
