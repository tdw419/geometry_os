; DESCRIPTION: Renders a green box of size 37x34 starting at (153, 22).
; PLAN: r0=153(x), r1=22(y), r2=37(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 22
LDI r2, 37
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
