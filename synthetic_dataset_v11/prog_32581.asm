; DESCRIPTION: Composite: . Then Creates a purple circular shape at (98, 107) with radius 76. Then Draws a white line from (183, 146) to (37, 112).
; PLAN: r0=98(x), r1=107(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=183(x1), r1=146(y1), r2=37(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (98, 107) with radius 76.
; PLAN: r0=98(x), r1=107(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 107
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (183, 146) to (37, 112).
; PLAN: r0=183(x1), r1=146(y1), r2=37(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 146
LDI r2, 37
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
