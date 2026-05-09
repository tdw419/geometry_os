; DESCRIPTION: Renders a green box of size 22x102 starting at (188, 150).
; PLAN: r0=188(x), r1=150(y), r2=22(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 150
LDI r2, 22
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
