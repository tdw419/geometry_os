; DESCRIPTION: Renders a green box of size 62x35 starting at (48, 114).
; PLAN: r0=48(x), r1=114(y), r2=62(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 114
LDI r2, 62
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
