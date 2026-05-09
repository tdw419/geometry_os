; DESCRIPTION: Composite: . Then Renders a yellow line between points (15, 152) and (59, 101). Then Creates a yellow rectangular region at (34, 147) spanning 96 by 94 pixels.
; PLAN: r0=15(x1), r1=152(y1), r2=59(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=34(x), r1=147(y), r2=96(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (15, 152) and (59, 101).
; PLAN: r0=15(x1), r1=152(y1), r2=59(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 152
LDI r2, 59
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (34, 147) spanning 96 by 94 pixels.
; PLAN: r0=34(x), r1=147(y), r2=96(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 147
LDI r2, 96
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
