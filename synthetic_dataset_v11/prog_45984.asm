; DESCRIPTION: Composite: . Then Draws a white line from (60, 193) to (74, 243). Then Places a yellow circle of radius 78 at center (118, 127).
; PLAN: r0=60(x1), r1=193(y1), r2=74(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=118(x), r1=127(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (60, 193) to (74, 243).
; PLAN: r0=60(x1), r1=193(y1), r2=74(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 193
LDI r2, 74
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 78 at center (118, 127).
; PLAN: r0=118(x), r1=127(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 127
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
