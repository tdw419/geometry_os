; DESCRIPTION: Renders a green box of size 101x107 starting at (91, 29).
; PLAN: r0=91(x), r1=29(y), r2=101(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 29
LDI r2, 101
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
