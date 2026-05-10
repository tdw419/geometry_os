; DESCRIPTION: Composite: Creates a red circular shape at (248, 214) with radius 16 then Renders a orange line between points (479, 28) and (174, 201) then Draws a white rectangle at (39, 106) with width 112 and height 18.
; PLAN: r0=248(x), r1=214(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=479(x1), r6=28(y1), r7=174(x2), r8=201(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=106(y), r12=112(width), r13=18(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 214
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 479
LDI r6, 28
LDI r7, 174
LDI r8, 201
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 106
LDI r12, 112
LDI r13, 18
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
