; DESCRIPTION: Composite: Renders a cyan line between points (24, 21) and (432, 130) then Draws a green rectangle at (446, 170) with width 18 and height 80.
; PLAN: r0=24(x1), r1=21(y1), r2=432(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=170(y), r7=18(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 21
LDI r2, 432
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 170
LDI r7, 18
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
