; DESCRIPTION: Composite: Creates a green circular shape at (288, 134) with radius 61 then Renders a orange box of size 70x47 starting at (323, 79) then Places a black line segment connecting (56, 179) to (503, 238).
; PLAN: r0=288(x), r1=134(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=79(y), r7=70(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x1), r11=179(y1), r12=503(x2), r13=238(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 288
LDI r1, 134
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 79
LDI r7, 70
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 179
LDI r12, 503
LDI r13, 238
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
