; DESCRIPTION: Composite: Places a red circle of radius 29 at center (248, 151) then Places a cyan line segment connecting (484, 16) to (393, 47) then Places a green 64x49 rectangle at position (87, 16).
; PLAN: r0=248(x), r1=151(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=484(x1), r6=16(y1), r7=393(x2), r8=47(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=87(x), r11=16(y), r12=64(width), r13=49(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 151
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 484
LDI r6, 16
LDI r7, 393
LDI r8, 47
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 16
LDI r12, 64
LDI r13, 49
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
