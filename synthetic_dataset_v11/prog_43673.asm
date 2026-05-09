; DESCRIPTION: Composite: . Then Draws a white circle centered at (82, 177) with radius 70. Then Draws a purple line from (79, 94) to (178, 214).
; PLAN: r0=82(x), r1=177(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=79(x1), r1=94(y1), r2=178(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (82, 177) with radius 70.
; PLAN: r0=82(x), r1=177(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 177
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (79, 94) to (178, 214).
; PLAN: r0=79(x1), r1=94(y1), r2=178(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 94
LDI r2, 178
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
