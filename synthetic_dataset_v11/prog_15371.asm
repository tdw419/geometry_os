; DESCRIPTION: Composite: . Then Draws a cyan line from (115, 220) to (79, 69). Then Places a blue circle of radius 76 at center (164, 165).
; PLAN: r0=115(x1), r1=220(y1), r2=79(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=164(x), r1=165(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (115, 220) to (79, 69).
; PLAN: r0=115(x1), r1=220(y1), r2=79(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 220
LDI r2, 79
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 76 at center (164, 165).
; PLAN: r0=164(x), r1=165(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 165
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
