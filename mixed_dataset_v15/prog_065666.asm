; DESCRIPTION: Composite: Renders a black box of size 67x114 starting at (349, 65) then Sets a single red pixel at (323, 90) then Draws a white line from (250, 218) to (394, 124).
; PLAN: r0=349(x), r1=65(y), r2=67(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=90(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=250(x1), r11=218(y1), r12=394(x2), r13=124(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 65
LDI r2, 67
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 90
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 250
LDI r11, 218
LDI r12, 394
LDI r13, 124
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
