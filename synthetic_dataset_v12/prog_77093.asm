; DESCRIPTION: Renders a yellow box of size 54x65 starting at (207, 106).
; PLAN: r0=207(x), r1=106(y), r2=54(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 106
LDI r2, 54
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
