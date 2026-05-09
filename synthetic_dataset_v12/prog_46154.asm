; DESCRIPTION: Composite: Places a purple dot at position (34, 65) then Creates a black rectangular region at (234, 38) spanning 57 by 40 pixels then Draws a cyan line from (281, 24) to (323, 220).
; PLAN: r0=34(x), r1=65(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=234(x), r6=38(y), r7=57(width), r8=40(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x1), r11=24(y1), r12=323(x2), r13=220(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 65
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 234
LDI r6, 38
LDI r7, 57
LDI r8, 40
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 24
LDI r12, 323
LDI r13, 220
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
