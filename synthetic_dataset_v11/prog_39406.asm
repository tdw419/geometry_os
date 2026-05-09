; DESCRIPTION: Renders a green box of size 10x40 starting at (66, 139).
; PLAN: r0=66(x), r1=139(y), r2=10(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 139
LDI r2, 10
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
