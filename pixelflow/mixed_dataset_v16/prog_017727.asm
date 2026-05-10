; DESCRIPTION: Composite: Places a yellow line segment connecting (129, 231) to (48, 129) then Draws a red rectangle at (118, 84) with width 86 and height 54 then Places a yellow dot at position (267, 217).
; PLAN: r0=129(x1), r1=231(y1), r2=48(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=84(y), r7=86(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=267(x), r11=217(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 129
LDI r1, 231
LDI r2, 48
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 84
LDI r7, 86
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 217
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
