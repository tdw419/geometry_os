; DESCRIPTION: Composite: . Then Renders a magenta line between points (56, 114) and (120, 79). Then Creates a purple rectangular region at (61, 57) spanning 118 by 110 pixels.
; PLAN: r0=56(x1), r1=114(y1), r2=120(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=57(y), r2=118(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (56, 114) and (120, 79).
; PLAN: r0=56(x1), r1=114(y1), r2=120(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 114
LDI r2, 120
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (61, 57) spanning 118 by 110 pixels.
; PLAN: r0=61(x), r1=57(y), r2=118(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 57
LDI r2, 118
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
