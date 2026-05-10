; DESCRIPTION: Renders a green box of size 76x22 starting at (242, 10).
; PLAN: r0=242(x), r1=10(y), r2=76(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 10
LDI r2, 76
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
