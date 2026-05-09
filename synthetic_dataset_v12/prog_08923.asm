; DESCRIPTION: Composite: Draws a cyan line from (22, 88) to (129, 233) then Creates a orange rectangular region at (130, 19) spanning 104 by 113 pixels then Places a blue dot at position (78, 165).
; PLAN: r0=22(x1), r1=88(y1), r2=129(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=19(y), r7=104(width), r8=113(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=78(x), r11=165(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 22
LDI r1, 88
LDI r2, 129
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 19
LDI r7, 104
LDI r8, 113
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 78
LDI r11, 165
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
