; DESCRIPTION: Composite: . Then Creates a purple circular shape at (117, 149) with radius 65. Then Draws a purple line from (79, 153) to (109, 210).
; PLAN: r0=117(x), r1=149(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=79(x1), r1=153(y1), r2=109(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (117, 149) with radius 65.
; PLAN: r0=117(x), r1=149(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 149
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (79, 153) to (109, 210).
; PLAN: r0=79(x1), r1=153(y1), r2=109(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 153
LDI r2, 109
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
