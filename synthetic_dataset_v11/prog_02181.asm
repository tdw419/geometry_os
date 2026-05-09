; DESCRIPTION: Composite: . Then Renders a red line between points (94, 243) and (247, 84). Then Places a orange 49x46 rectangle at position (183, 201).
; PLAN: r0=94(x1), r1=243(y1), r2=247(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=183(x), r1=201(y), r2=49(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (94, 243) and (247, 84).
; PLAN: r0=94(x1), r1=243(y1), r2=247(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 243
LDI r2, 247
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 49x46 rectangle at position (183, 201).
; PLAN: r0=183(x), r1=201(y), r2=49(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 201
LDI r2, 49
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
