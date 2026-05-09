; DESCRIPTION: Composite: . Then Draws a yellow circle centered at (47, 99) with radius 37. Then Renders a orange line between points (253, 42) and (90, 178).
; PLAN: r0=47(x), r1=99(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=253(x1), r1=42(y1), r2=90(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow circle centered at (47, 99) with radius 37.
; PLAN: r0=47(x), r1=99(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 99
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange line between points (253, 42) and (90, 178).
; PLAN: r0=253(x1), r1=42(y1), r2=90(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 42
LDI r2, 90
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
