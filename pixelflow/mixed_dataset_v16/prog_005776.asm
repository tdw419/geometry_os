; DESCRIPTION: Composite: Places a cyan line segment connecting (294, 185) to (256, 130) then Draws a yellow rectangle at (248, 4) with width 11 and height 114.
; PLAN: r0=294(x1), r1=185(y1), r2=256(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=248(x), r6=4(y), r7=11(width), r8=114(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 185
LDI r2, 256
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 4
LDI r7, 11
LDI r8, 114
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
