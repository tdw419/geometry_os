; DESCRIPTION: Renders a green box of size 85x100 starting at (259, 6).
; PLAN: r0=259(x), r1=6(y), r2=85(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 6
LDI r2, 85
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
