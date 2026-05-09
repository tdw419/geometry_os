; DESCRIPTION: Renders a green box of size 22x57 starting at (100, 18).
; PLAN: r0=100(x), r1=18(y), r2=22(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 18
LDI r2, 22
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
