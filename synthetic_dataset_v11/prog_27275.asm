; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (14, 8) spanning 102 by 26 pixels. Then Draws a yellow line from (51, 109) to (199, 145).
; PLAN: r0=14(x), r1=8(y), r2=102(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=51(x1), r1=109(y1), r2=199(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow rectangular region at (14, 8) spanning 102 by 26 pixels.
; PLAN: r0=14(x), r1=8(y), r2=102(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 8
LDI r2, 102
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (51, 109) to (199, 145).
; PLAN: r0=51(x1), r1=109(y1), r2=199(x2), r3=145(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 109
LDI r2, 199
LDI r3, 145
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
