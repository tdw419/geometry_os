; DESCRIPTION: Composite: . Then Places a green circle of radius 30 at center (204, 198). Then Draws a green line from (161, 58) to (181, 135).
; PLAN: r0=204(x), r1=198(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=161(x1), r1=58(y1), r2=181(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 30 at center (204, 198).
; PLAN: r0=204(x), r1=198(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 198
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (161, 58) to (181, 135).
; PLAN: r0=161(x1), r1=58(y1), r2=181(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 58
LDI r2, 181
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
