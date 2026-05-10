; DESCRIPTION: Composite: Creates a white rectangular region at (60, 126) spanning 67 by 100 pixels then Sets a single yellow pixel at (46, 193) then Draws a white line from (301, 15) to (90, 25).
; PLAN: r0=60(x), r1=126(y), r2=67(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=46(x), r6=193(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=301(x1), r11=15(y1), r12=90(x2), r13=25(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 126
LDI r2, 67
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 193
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 301
LDI r11, 15
LDI r12, 90
LDI r13, 25
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
