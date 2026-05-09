; DESCRIPTION: Composite: . Then Draws a yellow line from (135, 70) to (79, 98). Then Places a blue circle of radius 76 at center (118, 122).
; PLAN: r0=135(x1), r1=70(y1), r2=79(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=122(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a yellow line from (135, 70) to (79, 98).
; PLAN: r0=135(x1), r1=70(y1), r2=79(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 70
LDI r2, 79
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 76 at center (118, 122).
; PLAN: r0=118(x), r1=122(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 122
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
