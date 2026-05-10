; DESCRIPTION: Renders a green box of size 117x38 starting at (119, 109).
; PLAN: r0=119(x), r1=109(y), r2=117(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 109
LDI r2, 117
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
