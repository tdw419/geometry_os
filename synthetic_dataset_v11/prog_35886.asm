; DESCRIPTION: Composite: . Then Draws a yellow line from (249, 137) to (241, 162). Then Places a orange circle of radius 56 at center (161, 161).
; PLAN: r0=249(x1), r1=137(y1), r2=241(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=161(x), r1=161(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (249, 137) to (241, 162).
; PLAN: r0=249(x1), r1=137(y1), r2=241(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 137
LDI r2, 241
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 56 at center (161, 161).
; PLAN: r0=161(x), r1=161(y), r2=56(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 161
LDI r2, 56
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
