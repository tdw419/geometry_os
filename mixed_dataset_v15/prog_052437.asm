; DESCRIPTION: Composite: Creates a purple circular shape at (213, 96) with radius 38 then Renders a black box of size 43x52 starting at (139, 121) then Places a green line segment connecting (306, 215) to (473, 164).
; PLAN: r0=213(x), r1=96(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=139(x), r6=121(y), r7=43(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=306(x1), r11=215(y1), r12=473(x2), r13=164(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 96
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 139
LDI r6, 121
LDI r7, 43
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 215
LDI r12, 473
LDI r13, 164
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
