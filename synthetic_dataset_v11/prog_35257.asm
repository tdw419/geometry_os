; DESCRIPTION: Composite: . Then Places a white circle of radius 19 at center (146, 186). Then Draws a green line from (201, 51) to (183, 252).
; PLAN: r0=146(x), r1=186(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=201(x1), r1=51(y1), r2=183(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 19 at center (146, 186).
; PLAN: r0=146(x), r1=186(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 186
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (201, 51) to (183, 252).
; PLAN: r0=201(x1), r1=51(y1), r2=183(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 51
LDI r2, 183
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
