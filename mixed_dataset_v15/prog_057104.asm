; DESCRIPTION: Composite: Places a blue line segment connecting (466, 44) to (187, 61) then Creates a cyan circular shape at (85, 151) with radius 79 then Renders a orange box of size 94x83 starting at (203, 158).
; PLAN: r0=466(x1), r1=44(y1), r2=187(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=85(x), r6=151(y), r7=79(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x), r11=158(y), r12=94(width), r13=83(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 44
LDI r2, 187
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 151
LDI r7, 79
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 158
LDI r12, 94
LDI r13, 83
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
