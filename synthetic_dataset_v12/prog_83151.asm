; DESCRIPTION: Composite: Creates a blue circular shape at (73, 177) with radius 12 then Places a white line segment connecting (349, 47) to (75, 252) then Creates a black rectangular region at (247, 66) spanning 22 by 35 pixels.
; PLAN: r0=73(x), r1=177(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x1), r6=47(y1), r7=75(x2), r8=252(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=247(x), r11=66(y), r12=22(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 73
LDI r1, 177
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 47
LDI r7, 75
LDI r8, 252
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 247
LDI r11, 66
LDI r12, 22
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
