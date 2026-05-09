; DESCRIPTION: Composite: Places a cyan 30x95 rectangle at position (435, 150) then Renders a green disk with center (152, 159) and radius 16 then Places a red line segment connecting (233, 62) to (234, 255).
; PLAN: r0=435(x), r1=150(y), r2=30(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x), r6=159(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=233(x1), r11=62(y1), r12=234(x2), r13=255(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 435
LDI r1, 150
LDI r2, 30
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 159
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 233
LDI r11, 62
LDI r12, 234
LDI r13, 255
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
