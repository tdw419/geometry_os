; DESCRIPTION: Composite: Sets a single orange pixel at (410, 213) then Renders a purple line between points (394, 248) and (420, 10) then Draws a yellow rectangle at (128, 122) with width 116 and height 110.
; PLAN: r0=410(x), r1=213(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=394(x1), r6=248(y1), r7=420(x2), r8=10(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=128(x), r11=122(y), r12=116(width), r13=110(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 410
LDI r1, 213
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 394
LDI r6, 248
LDI r7, 420
LDI r8, 10
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 122
LDI r12, 116
LDI r13, 110
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
