; DESCRIPTION: Composite: Renders a red line between points (18, 54) and (13, 224) then Renders a orange disk with center (249, 108) and radius 44 then Places a cyan 116x103 rectangle at position (181, 106).
; PLAN: r0=18(x1), r1=54(y1), r2=13(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=108(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=181(x), r11=106(y), r12=116(width), r13=103(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 54
LDI r2, 13
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 108
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 181
LDI r11, 106
LDI r12, 116
LDI r13, 103
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
