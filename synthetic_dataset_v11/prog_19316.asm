; DESCRIPTION: Composite: . Then Places a red circle of radius 58 at center (146, 60). Then Renders a yellow line between points (141, 234) and (74, 24).
; PLAN: r0=146(x), r1=60(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=141(x1), r1=234(y1), r2=74(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 58 at center (146, 60).
; PLAN: r0=146(x), r1=60(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 60
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow line between points (141, 234) and (74, 24).
; PLAN: r0=141(x1), r1=234(y1), r2=74(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 234
LDI r2, 74
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
