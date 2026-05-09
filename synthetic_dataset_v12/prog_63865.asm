; DESCRIPTION: Renders a green box of size 108x54 starting at (311, 144).
; PLAN: r0=311(x), r1=144(y), r2=108(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 144
LDI r2, 108
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
