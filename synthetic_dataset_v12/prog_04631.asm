; DESCRIPTION: Composite: Creates a white circular shape at (103, 183) with radius 66 then Draws a white line from (260, 73) to (10, 95) then Renders a green box of size 17x70 starting at (443, 50).
; PLAN: r0=103(x), r1=183(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x1), r6=73(y1), r7=10(x2), r8=95(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=443(x), r11=50(y), r12=17(width), r13=70(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 103
LDI r1, 183
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 73
LDI r7, 10
LDI r8, 95
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 50
LDI r12, 17
LDI r13, 70
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
