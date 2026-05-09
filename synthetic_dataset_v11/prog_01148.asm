; DESCRIPTION: Composite: . Then Draws a black line from (38, 119) to (201, 55). Then Places a white circle of radius 64 at center (143, 127).
; PLAN: r0=38(x1), r1=119(y1), r2=201(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=143(x), r1=127(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (38, 119) to (201, 55).
; PLAN: r0=38(x1), r1=119(y1), r2=201(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 119
LDI r2, 201
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white circle of radius 64 at center (143, 127).
; PLAN: r0=143(x), r1=127(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 127
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
