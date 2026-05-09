; DESCRIPTION: Renders a green box of size 117x76 starting at (20, 12).
; PLAN: r0=20(x), r1=12(y), r2=117(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 12
LDI r2, 117
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
