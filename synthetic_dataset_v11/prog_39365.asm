; DESCRIPTION: Composite: . Then Places a yellow circle of radius 57 at center (122, 121). Then Draws a black line from (79, 52) to (210, 161).
; PLAN: r0=122(x), r1=121(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=79(x1), r1=52(y1), r2=210(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 57 at center (122, 121).
; PLAN: r0=122(x), r1=121(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 121
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (79, 52) to (210, 161).
; PLAN: r0=79(x1), r1=52(y1), r2=210(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 52
LDI r2, 210
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
