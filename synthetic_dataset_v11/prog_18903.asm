; DESCRIPTION: Composite: . Then Renders a white box of size 91x113 starting at (154, 59). Then Renders a purple line between points (79, 99) and (136, 218).
; PLAN: r0=154(x), r1=59(y), r2=91(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=79(x1), r1=99(y1), r2=136(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 91x113 starting at (154, 59).
; PLAN: r0=154(x), r1=59(y), r2=91(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 59
LDI r2, 91
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (79, 99) and (136, 218).
; PLAN: r0=79(x1), r1=99(y1), r2=136(x2), r3=218(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 99
LDI r2, 136
LDI r3, 218
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
