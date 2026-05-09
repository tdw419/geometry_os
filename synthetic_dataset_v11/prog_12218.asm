; DESCRIPTION: Renders a green box of size 80x34 starting at (56, 7).
; PLAN: r0=56(x), r1=7(y), r2=80(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 7
LDI r2, 80
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
