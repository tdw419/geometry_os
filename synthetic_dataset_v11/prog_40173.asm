; DESCRIPTION: Renders a green box of size 115x76 starting at (86, 170).
; PLAN: r0=86(x), r1=170(y), r2=115(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 170
LDI r2, 115
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
