; DESCRIPTION: Renders a green box of size 22x34 starting at (398, 101).
; PLAN: r0=398(x), r1=101(y), r2=22(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 101
LDI r2, 22
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
