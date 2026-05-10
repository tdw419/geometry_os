; DESCRIPTION: Composite: Creates a purple rectangular region at (464, 173) spanning 38 by 35 pixels then Renders a cyan line between points (257, 84) and (31, 111) then Renders a green disk with center (192, 53) and radius 30.
; PLAN: r0=464(x), r1=173(y), r2=38(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x1), r6=84(y1), r7=31(x2), r8=111(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=192(x), r11=53(y), r12=30(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 173
LDI r2, 38
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 84
LDI r7, 31
LDI r8, 111
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 53
LDI r12, 30
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
