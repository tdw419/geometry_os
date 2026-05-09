; DESCRIPTION: Composite: Draws a yellow line from (484, 128) to (217, 137) then Creates a red rectangular region at (328, 24) spanning 116 by 50 pixels.
; PLAN: r0=484(x1), r1=128(y1), r2=217(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=24(y), r7=116(width), r8=50(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 128
LDI r2, 217
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 24
LDI r7, 116
LDI r8, 50
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
