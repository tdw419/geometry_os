; DESCRIPTION: Composite: Places a black dot at position (120, 129) then Draws a orange rectangle at (223, 52) with width 89 and height 104 then Renders a magenta line between points (0, 154) and (165, 250).
; PLAN: r0=120(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=52(y), r7=89(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=0(x1), r11=154(y1), r12=165(x2), r13=250(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 129
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 223
LDI r6, 52
LDI r7, 89
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 154
LDI r12, 165
LDI r13, 250
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
