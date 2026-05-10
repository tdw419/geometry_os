; DESCRIPTION: Composite: Places a purple 28x64 rectangle at position (402, 25) then Renders a magenta disk with center (198, 47) and radius 19 then Places a black line segment connecting (139, 190) to (130, 220).
; PLAN: r0=402(x), r1=25(y), r2=28(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=47(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x1), r11=190(y1), r12=130(x2), r13=220(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 402
LDI r1, 25
LDI r2, 28
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 47
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 190
LDI r12, 130
LDI r13, 220
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
