; DESCRIPTION: Composite: . Then Places a white circle of radius 52 at center (101, 75). Then Draws a red line from (50, 78) to (131, 58).
; PLAN: r0=101(x), r1=75(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=50(x1), r1=78(y1), r2=131(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 52 at center (101, 75).
; PLAN: r0=101(x), r1=75(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 75
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (50, 78) to (131, 58).
; PLAN: r0=50(x1), r1=78(y1), r2=131(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 78
LDI r2, 131
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
