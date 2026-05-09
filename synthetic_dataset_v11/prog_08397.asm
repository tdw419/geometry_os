; DESCRIPTION: Composite: . Then Places a black line segment connecting (250, 160) to (120, 34). Then Draws a cyan circle centered at (146, 159) with radius 58.
; PLAN: r0=250(x1), r1=160(y1), r2=120(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=146(x), r1=159(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black line segment connecting (250, 160) to (120, 34).
; PLAN: r0=250(x1), r1=160(y1), r2=120(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 160
LDI r2, 120
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan circle centered at (146, 159) with radius 58.
; PLAN: r0=146(x), r1=159(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 159
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
