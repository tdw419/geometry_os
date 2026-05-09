; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (169, 33) spanning 81 by 120 pixels. Then Draws a orange line from (253, 74) to (44, 251).
; PLAN: r0=169(x), r1=33(y), r2=81(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=253(x1), r1=74(y1), r2=44(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue rectangular region at (169, 33) spanning 81 by 120 pixels.
; PLAN: r0=169(x), r1=33(y), r2=81(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 33
LDI r2, 81
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange line from (253, 74) to (44, 251).
; PLAN: r0=253(x1), r1=74(y1), r2=44(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 74
LDI r2, 44
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
