; DESCRIPTION: Composite: Places a green dot at position (409, 70) then Renders a white line between points (8, 169) and (290, 105) then Draws a magenta rectangle at (422, 103) with width 88 and height 97.
; PLAN: r0=409(x), r1=70(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=169(y1), r7=290(x2), r8=105(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=103(y), r12=88(width), r13=97(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 70
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 8
LDI r6, 169
LDI r7, 290
LDI r8, 105
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 103
LDI r12, 88
LDI r13, 97
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
