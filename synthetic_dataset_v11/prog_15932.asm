; DESCRIPTION: Composite: . Then Creates a green rectangular region at (45, 77) spanning 105 by 99 pixels. Then Draws a purple line from (178, 44) to (151, 17).
; PLAN: r0=45(x), r1=77(y), r2=105(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=178(x1), r1=44(y1), r2=151(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green rectangular region at (45, 77) spanning 105 by 99 pixels.
; PLAN: r0=45(x), r1=77(y), r2=105(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 77
LDI r2, 105
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (178, 44) to (151, 17).
; PLAN: r0=178(x1), r1=44(y1), r2=151(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 44
LDI r2, 151
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
