; DESCRIPTION: Composite: . Then Places a blue line segment connecting (107, 61) to (96, 97). Then Creates a green rectangular region at (28, 7) spanning 60 by 47 pixels.
; PLAN: r0=107(x1), r1=61(y1), r2=96(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=28(x), r1=7(y), r2=60(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue line segment connecting (107, 61) to (96, 97).
; PLAN: r0=107(x1), r1=61(y1), r2=96(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 61
LDI r2, 96
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (28, 7) spanning 60 by 47 pixels.
; PLAN: r0=28(x), r1=7(y), r2=60(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 7
LDI r2, 60
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
