; DESCRIPTION: Composite: Creates a blue circular shape at (89, 130) with radius 50 then Renders a green line between points (491, 84) and (492, 206) then Places a green dot at position (207, 107).
; PLAN: r0=89(x), r1=130(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x1), r6=84(y1), r7=492(x2), r8=206(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=107(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 89
LDI r1, 130
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 84
LDI r7, 492
LDI r8, 206
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 107
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
