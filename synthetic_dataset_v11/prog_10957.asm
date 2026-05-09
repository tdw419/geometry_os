; DESCRIPTION: Composite: . Then Draws a black line from (185, 94) to (161, 218). Then Places a cyan circle of radius 15 at center (102, 165).
; PLAN: r0=185(x1), r1=94(y1), r2=161(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=102(x), r1=165(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (185, 94) to (161, 218).
; PLAN: r0=185(x1), r1=94(y1), r2=161(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 94
LDI r2, 161
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 15 at center (102, 165).
; PLAN: r0=102(x), r1=165(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 165
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
