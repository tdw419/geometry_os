; DESCRIPTION: Composite: . Then Creates a orange circular shape at (41, 73) with radius 39. Then Draws a green line from (103, 226) to (61, 201).
; PLAN: r0=41(x), r1=73(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=103(x1), r1=226(y1), r2=61(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (41, 73) with radius 39.
; PLAN: r0=41(x), r1=73(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 73
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (103, 226) to (61, 201).
; PLAN: r0=103(x1), r1=226(y1), r2=61(x2), r3=201(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 226
LDI r2, 61
LDI r3, 201
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
