; DESCRIPTION: Composite: . Then Renders a green line between points (136, 29) and (234, 169). Then Creates a black rectangular region at (147, 156) spanning 79 by 75 pixels.
; PLAN: r0=136(x1), r1=29(y1), r2=234(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=147(x), r1=156(y), r2=79(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (136, 29) and (234, 169).
; PLAN: r0=136(x1), r1=29(y1), r2=234(x2), r3=169(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 29
LDI r2, 234
LDI r3, 169
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black rectangular region at (147, 156) spanning 79 by 75 pixels.
; PLAN: r0=147(x), r1=156(y), r2=79(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 156
LDI r2, 79
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
