; DESCRIPTION: Composite: Renders a purple line between points (95, 224) and (206, 24) then Renders a cyan disk with center (428, 71) and radius 52 then Places a purple 63x38 rectangle at position (198, 218).
; PLAN: r0=95(x1), r1=224(y1), r2=206(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=71(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=198(x), r11=218(y), r12=63(width), r13=38(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 224
LDI r2, 206
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 71
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 198
LDI r11, 218
LDI r12, 63
LDI r13, 38
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
