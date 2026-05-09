; DESCRIPTION: Composite: . Then Places a white circle of radius 22 at center (80, 189). Then Draws a yellow line from (206, 34) to (53, 19).
; PLAN: r0=80(x), r1=189(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=206(x1), r1=34(y1), r2=53(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 22 at center (80, 189).
; PLAN: r0=80(x), r1=189(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 189
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (206, 34) to (53, 19).
; PLAN: r0=206(x1), r1=34(y1), r2=53(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 34
LDI r2, 53
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
