; DESCRIPTION: Composite: Renders a yellow line between points (384, 48) and (176, 15) then Creates a red rectangular region at (417, 3) spanning 40 by 96 pixels then Sets a single orange pixel at (364, 100).
; PLAN: r0=384(x1), r1=48(y1), r2=176(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=417(x), r6=3(y), r7=40(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=364(x), r11=100(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 48
LDI r2, 176
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 3
LDI r7, 40
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 100
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
