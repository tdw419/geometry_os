; DESCRIPTION: Renders a green box of size 40x101 starting at (150, 115).
; PLAN: r0=150(x), r1=115(y), r2=40(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 115
LDI r2, 40
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
