; DESCRIPTION: Composite: . Then Draws a green line from (252, 121) to (24, 127). Then Places a red circle of radius 33 at center (76, 222).
; PLAN: r0=252(x1), r1=121(y1), r2=24(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=76(x), r1=222(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (252, 121) to (24, 127).
; PLAN: r0=252(x1), r1=121(y1), r2=24(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 121
LDI r2, 24
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 33 at center (76, 222).
; PLAN: r0=76(x), r1=222(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 222
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
