; DESCRIPTION: Composite: . Then Places a red circle of radius 54 at center (160, 76). Then Draws a purple line from (206, 82) to (181, 101).
; PLAN: r0=160(x), r1=76(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=206(x1), r1=82(y1), r2=181(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 54 at center (160, 76).
; PLAN: r0=160(x), r1=76(y), r2=54(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 76
LDI r2, 54
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (206, 82) to (181, 101).
; PLAN: r0=206(x1), r1=82(y1), r2=181(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 82
LDI r2, 181
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
