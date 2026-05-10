; DESCRIPTION: Composite: Renders a cyan disk with center (281, 104) and radius 52 then Renders a cyan line between points (141, 1) and (433, 44) then Renders a purple box of size 93x42 starting at (325, 144).
; PLAN: r0=281(x), r1=104(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x1), r6=1(y1), r7=433(x2), r8=44(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=144(y), r12=93(width), r13=42(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 104
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 1
LDI r7, 433
LDI r8, 44
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 144
LDI r12, 93
LDI r13, 42
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
