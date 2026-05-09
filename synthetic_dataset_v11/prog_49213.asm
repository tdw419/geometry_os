; DESCRIPTION: Composite: . Then Draws a white line from (20, 246) to (179, 24). Then Places a orange circle of radius 41 at center (53, 57).
; PLAN: r0=20(x1), r1=246(y1), r2=179(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=53(x), r1=57(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (20, 246) to (179, 24).
; PLAN: r0=20(x1), r1=246(y1), r2=179(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 246
LDI r2, 179
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 41 at center (53, 57).
; PLAN: r0=53(x), r1=57(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 57
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
