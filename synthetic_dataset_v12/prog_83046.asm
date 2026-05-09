; DESCRIPTION: Composite: Places a black line segment connecting (305, 100) to (465, 89) then Creates a yellow circular shape at (391, 152) with radius 65 then Places a cyan 40x120 rectangle at position (109, 24).
; PLAN: r0=305(x1), r1=100(y1), r2=465(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=152(y), r7=65(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=109(x), r11=24(y), r12=40(width), r13=120(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 100
LDI r2, 465
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 152
LDI r7, 65
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 109
LDI r11, 24
LDI r12, 40
LDI r13, 120
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
