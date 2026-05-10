; DESCRIPTION: Composite: Places a magenta 34x13 rectangle at position (462, 237) then Renders a green line between points (115, 88) and (400, 3) then Places a blue dot at position (290, 6).
; PLAN: r0=462(x), r1=237(y), r2=34(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x1), r6=88(y1), r7=400(x2), r8=3(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=290(x), r11=6(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 462
LDI r1, 237
LDI r2, 34
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 88
LDI r7, 400
LDI r8, 3
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 6
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
