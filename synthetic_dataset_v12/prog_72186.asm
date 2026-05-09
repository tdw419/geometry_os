; DESCRIPTION: Composite: Renders a cyan box of size 94x19 starting at (192, 28) then Places a purple circle of radius 16 at center (312, 182) then Draws a yellow line from (103, 82) to (85, 15).
; PLAN: r0=192(x), r1=28(y), r2=94(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=182(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=103(x1), r11=82(y1), r12=85(x2), r13=15(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 28
LDI r2, 94
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 182
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 103
LDI r11, 82
LDI r12, 85
LDI r13, 15
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
