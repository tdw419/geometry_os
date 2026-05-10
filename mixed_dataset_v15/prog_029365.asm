; DESCRIPTION: Composite: Creates a purple rectangular region at (241, 161) spanning 42 by 93 pixels then Renders a magenta disk with center (365, 131) and radius 51 then Draws a purple line from (152, 252) to (280, 9).
; PLAN: r0=241(x), r1=161(y), r2=42(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=131(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=152(x1), r11=252(y1), r12=280(x2), r13=9(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 161
LDI r2, 42
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 131
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 152
LDI r11, 252
LDI r12, 280
LDI r13, 9
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
