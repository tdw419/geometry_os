; DESCRIPTION: Composite: . Then Draws a red line from (219, 115) to (197, 62). Then Places a green circle of radius 23 at center (93, 72).
; PLAN: r0=219(x1), r1=115(y1), r2=197(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=72(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (219, 115) to (197, 62).
; PLAN: r0=219(x1), r1=115(y1), r2=197(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 115
LDI r2, 197
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 23 at center (93, 72).
; PLAN: r0=93(x), r1=72(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 72
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
