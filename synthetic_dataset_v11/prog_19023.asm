; DESCRIPTION: Composite: . Then Draws a black circle centered at (75, 69) with radius 45. Then Draws a yellow line from (241, 68) to (221, 56).
; PLAN: r0=75(x), r1=69(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=241(x1), r1=68(y1), r2=221(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (75, 69) with radius 45.
; PLAN: r0=75(x), r1=69(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 69
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (241, 68) to (221, 56).
; PLAN: r0=241(x1), r1=68(y1), r2=221(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 68
LDI r2, 221
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
