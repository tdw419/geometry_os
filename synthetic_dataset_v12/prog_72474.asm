; DESCRIPTION: Composite: Renders a blue line between points (135, 1) and (346, 204) then Creates a white rectangular region at (201, 164) spanning 41 by 29 pixels then Draws a cyan circle centered at (285, 201) with radius 50.
; PLAN: r0=135(x1), r1=1(y1), r2=346(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=164(y), r7=41(width), r8=29(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=285(x), r11=201(y), r12=50(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 135
LDI r1, 1
LDI r2, 346
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 164
LDI r7, 41
LDI r8, 29
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 201
LDI r12, 50
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
