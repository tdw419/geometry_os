; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (152, 56) spanning 63 by 40 pixels. Then Renders a orange line between points (186, 235) and (194, 217).
; PLAN: r0=152(x), r1=56(y), r2=63(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=186(x1), r1=235(y1), r2=194(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue rectangular region at (152, 56) spanning 63 by 40 pixels.
; PLAN: r0=152(x), r1=56(y), r2=63(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 56
LDI r2, 63
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (186, 235) and (194, 217).
; PLAN: r0=186(x1), r1=235(y1), r2=194(x2), r3=217(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 235
LDI r2, 194
LDI r3, 217
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
