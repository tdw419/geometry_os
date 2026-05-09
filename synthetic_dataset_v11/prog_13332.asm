; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (34, 209) spanning 75 by 18 pixels. Then Renders a white line between points (13, 155) and (186, 252).
; PLAN: r0=34(x), r1=209(y), r2=75(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=13(x1), r1=155(y1), r2=186(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue rectangular region at (34, 209) spanning 75 by 18 pixels.
; PLAN: r0=34(x), r1=209(y), r2=75(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 209
LDI r2, 75
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (13, 155) and (186, 252).
; PLAN: r0=13(x1), r1=155(y1), r2=186(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 155
LDI r2, 186
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
