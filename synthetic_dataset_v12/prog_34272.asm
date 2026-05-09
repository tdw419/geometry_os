; DESCRIPTION: Composite: Renders a green box of size 120x16 starting at (346, 58) then Sets a single black pixel at (508, 160) then Renders a red line between points (349, 166) and (175, 169).
; PLAN: r0=346(x), r1=58(y), r2=120(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x), r6=160(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=349(x1), r11=166(y1), r12=175(x2), r13=169(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 58
LDI r2, 120
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 160
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 349
LDI r11, 166
LDI r12, 175
LDI r13, 169
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
