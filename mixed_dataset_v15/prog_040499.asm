; DESCRIPTION: Composite: Creates a magenta rectangular region at (304, 24) spanning 31 by 60 pixels then Sets a single green pixel at (236, 174) then Renders a blue line between points (217, 197) and (407, 118).
; PLAN: r0=304(x), r1=24(y), r2=31(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=174(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=217(x1), r11=197(y1), r12=407(x2), r13=118(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 24
LDI r2, 31
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 174
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 217
LDI r11, 197
LDI r12, 407
LDI r13, 118
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
