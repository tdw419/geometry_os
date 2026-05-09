; DESCRIPTION: Composite: Renders a red line between points (80, 34) and (294, 217) then Creates a purple circular shape at (279, 186) with radius 23 then Places a cyan 10x72 rectangle at position (80, 71).
; PLAN: r0=80(x1), r1=34(y1), r2=294(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=186(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x), r11=71(y), r12=10(width), r13=72(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 80
LDI r1, 34
LDI r2, 294
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 186
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 71
LDI r12, 10
LDI r13, 72
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
