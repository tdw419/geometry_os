; DESCRIPTION: Composite: Renders a red disk with center (271, 211) and radius 41 then Places a purple line segment connecting (379, 64) to (13, 137) then Renders a black box of size 120x39 starting at (96, 40).
; PLAN: r0=271(x), r1=211(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x1), r6=64(y1), r7=13(x2), r8=137(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=96(x), r11=40(y), r12=120(width), r13=39(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 211
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 64
LDI r7, 13
LDI r8, 137
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 96
LDI r11, 40
LDI r12, 120
LDI r13, 39
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
