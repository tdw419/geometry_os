; DESCRIPTION: Composite: Renders a magenta line between points (121, 40) and (47, 27) then Places a white 47x104 rectangle at position (295, 146) then Draws a magenta circle centered at (290, 89) with radius 63.
; PLAN: r0=121(x1), r1=40(y1), r2=47(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=146(y), r7=47(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x), r11=89(y), r12=63(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 40
LDI r2, 47
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 146
LDI r7, 47
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 89
LDI r12, 63
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
