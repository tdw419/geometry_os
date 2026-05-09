; DESCRIPTION: Composite: . Then Places a yellow circle of radius 25 at center (123, 135). Then Draws a cyan line from (216, 218) to (185, 158).
; PLAN: r0=123(x), r1=135(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=216(x1), r1=218(y1), r2=185(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 25 at center (123, 135).
; PLAN: r0=123(x), r1=135(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 135
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (216, 218) to (185, 158).
; PLAN: r0=216(x1), r1=218(y1), r2=185(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 218
LDI r2, 185
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
