; DESCRIPTION: Composite: . Then Creates a orange circular shape at (154, 127) with radius 75. Then Draws a purple line from (75, 236) to (141, 30).
; PLAN: r0=154(x), r1=127(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=75(x1), r1=236(y1), r2=141(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (154, 127) with radius 75.
; PLAN: r0=154(x), r1=127(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 127
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (75, 236) to (141, 30).
; PLAN: r0=75(x1), r1=236(y1), r2=141(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 236
LDI r2, 141
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
