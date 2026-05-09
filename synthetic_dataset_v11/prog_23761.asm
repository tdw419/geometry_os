; DESCRIPTION: Composite: . Then Places a purple circle of radius 65 at center (97, 174). Then Draws a black line from (17, 56) to (0, 57).
; PLAN: r0=97(x), r1=174(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=17(x1), r1=56(y1), r2=0(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 65 at center (97, 174).
; PLAN: r0=97(x), r1=174(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 174
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black line from (17, 56) to (0, 57).
; PLAN: r0=17(x1), r1=56(y1), r2=0(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 56
LDI r2, 0
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
