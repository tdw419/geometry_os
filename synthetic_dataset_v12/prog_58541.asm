; DESCRIPTION: Composite: Renders a blue box of size 91x48 starting at (359, 15) then Places a green line segment connecting (230, 219) to (130, 250).
; PLAN: r0=359(x), r1=15(y), r2=91(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x1), r6=219(y1), r7=130(x2), r8=250(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 359
LDI r1, 15
LDI r2, 91
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 219
LDI r7, 130
LDI r8, 250
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
