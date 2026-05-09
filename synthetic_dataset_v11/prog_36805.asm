; DESCRIPTION: Composite: . Then Renders a yellow disk with center (138, 74) and radius 34. Then Draws a blue line from (213, 70) to (0, 225).
; PLAN: r0=138(x), r1=74(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=213(x1), r1=70(y1), r2=0(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow disk with center (138, 74) and radius 34.
; PLAN: r0=138(x), r1=74(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 74
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (213, 70) to (0, 225).
; PLAN: r0=213(x1), r1=70(y1), r2=0(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 70
LDI r2, 0
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
