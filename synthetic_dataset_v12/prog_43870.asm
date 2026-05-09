; DESCRIPTION: Composite: Places a green line segment connecting (62, 232) to (99, 209) then Renders a blue box of size 39x47 starting at (123, 161).
; PLAN: r0=62(x1), r1=232(y1), r2=99(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=161(y), r7=39(width), r8=47(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 232
LDI r2, 99
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 161
LDI r7, 39
LDI r8, 47
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
