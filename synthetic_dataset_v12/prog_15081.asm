; DESCRIPTION: Renders a green box of size 55x78 starting at (291, 109).
; PLAN: r0=291(x), r1=109(y), r2=55(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 109
LDI r2, 55
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
