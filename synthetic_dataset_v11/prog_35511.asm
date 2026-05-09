; DESCRIPTION: Renders a green box of size 98x101 starting at (146, 130).
; PLAN: r0=146(x), r1=130(y), r2=98(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 130
LDI r2, 98
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
