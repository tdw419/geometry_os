; DESCRIPTION: Composite: Creates a white circular shape at (245, 51) with radius 34 then Draws a green line from (274, 55) to (75, 208) then Creates a purple rectangular region at (415, 56) spanning 83 by 53 pixels.
; PLAN: r0=245(x), r1=51(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x1), r6=55(y1), r7=75(x2), r8=208(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=415(x), r11=56(y), r12=83(width), r13=53(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 51
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 55
LDI r7, 75
LDI r8, 208
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 56
LDI r12, 83
LDI r13, 53
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
