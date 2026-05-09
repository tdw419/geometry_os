; DESCRIPTION: Renders a green box of size 71x78 starting at (10, 20).
; PLAN: r0=10(x), r1=20(y), r2=71(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 20
LDI r2, 71
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
