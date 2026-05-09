; DESCRIPTION: Composite: Places a green line segment connecting (68, 129) to (263, 159) then Draws a blue rectangle at (216, 170) with width 39 and height 77 then Creates a cyan circular shape at (371, 73) with radius 25.
; PLAN: r0=68(x1), r1=129(y1), r2=263(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=170(y), r7=39(width), r8=77(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=73(y), r12=25(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 68
LDI r1, 129
LDI r2, 263
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 170
LDI r7, 39
LDI r8, 77
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 73
LDI r12, 25
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
