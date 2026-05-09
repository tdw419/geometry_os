; DESCRIPTION: Composite: . Then Renders a white line between points (19, 82) and (183, 161). Then Creates a white circular shape at (195, 118) with radius 28.
; PLAN: r0=19(x1), r1=82(y1), r2=183(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=195(x), r1=118(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (19, 82) and (183, 161).
; PLAN: r0=19(x1), r1=82(y1), r2=183(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 82
LDI r2, 183
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (195, 118) with radius 28.
; PLAN: r0=195(x), r1=118(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 118
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
