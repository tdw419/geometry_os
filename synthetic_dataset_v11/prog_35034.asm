; DESCRIPTION: Composite: . Then Creates a green rectangular region at (38, 116) spanning 27 by 54 pixels. Then Renders a blue line between points (106, 216) and (11, 145).
; PLAN: r0=38(x), r1=116(y), r2=27(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=106(x1), r1=216(y1), r2=11(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green rectangular region at (38, 116) spanning 27 by 54 pixels.
; PLAN: r0=38(x), r1=116(y), r2=27(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 116
LDI r2, 27
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (106, 216) and (11, 145).
; PLAN: r0=106(x1), r1=216(y1), r2=11(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 216
LDI r2, 11
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
