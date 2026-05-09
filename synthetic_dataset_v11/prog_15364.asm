; DESCRIPTION: Composite: . Then Draws a green line from (155, 97) to (72, 75). Then Creates a purple circular shape at (182, 115) with radius 42.
; PLAN: r0=155(x1), r1=97(y1), r2=72(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=182(x), r1=115(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (155, 97) to (72, 75).
; PLAN: r0=155(x1), r1=97(y1), r2=72(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 97
LDI r2, 72
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple circular shape at (182, 115) with radius 42.
; PLAN: r0=182(x), r1=115(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 115
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
