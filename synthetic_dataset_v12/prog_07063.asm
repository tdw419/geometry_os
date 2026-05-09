; DESCRIPTION: Composite: Creates a purple circular shape at (371, 152) with radius 70 then Renders a yellow line between points (26, 22) and (439, 0) then Renders a white box of size 94x21 starting at (115, 168).
; PLAN: r0=371(x), r1=152(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=22(y1), r7=439(x2), r8=0(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=168(y), r12=94(width), r13=21(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 152
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 22
LDI r7, 439
LDI r8, 0
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 168
LDI r12, 94
LDI r13, 21
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
