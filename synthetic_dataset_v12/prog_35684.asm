; DESCRIPTION: Composite: Places a red dot at position (363, 96) then Creates a white rectangular region at (273, 19) spanning 16 by 92 pixels then Places a purple line segment connecting (320, 210) to (13, 194).
; PLAN: r0=363(x), r1=96(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=19(y), r7=16(width), r8=92(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x1), r11=210(y1), r12=13(x2), r13=194(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 96
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 273
LDI r6, 19
LDI r7, 16
LDI r8, 92
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 210
LDI r12, 13
LDI r13, 194
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
