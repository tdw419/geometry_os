; DESCRIPTION: Composite: . Then Draws a red circle centered at (215, 41) with radius 38. Then Draws a blue line from (194, 177) to (60, 59).
; PLAN: r0=215(x), r1=41(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=194(x1), r1=177(y1), r2=60(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (215, 41) with radius 38.
; PLAN: r0=215(x), r1=41(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 41
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (194, 177) to (60, 59).
; PLAN: r0=194(x1), r1=177(y1), r2=60(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 177
LDI r2, 60
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
