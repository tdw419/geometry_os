; DESCRIPTION: Composite: Renders a red disk with center (144, 92) and radius 49 then Renders a purple box of size 56x104 starting at (251, 74) then Renders a black line between points (410, 24) and (405, 93).
; PLAN: r0=144(x), r1=92(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=74(y), r7=56(width), r8=104(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x1), r11=24(y1), r12=405(x2), r13=93(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 92
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 74
LDI r7, 56
LDI r8, 104
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 24
LDI r12, 405
LDI r13, 93
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
