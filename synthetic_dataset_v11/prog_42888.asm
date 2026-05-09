; DESCRIPTION: Composite: . Then Draws a blue line from (16, 91) to (167, 189). Then Places a yellow circle of radius 68 at center (92, 106).
; PLAN: r0=16(x1), r1=91(y1), r2=167(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=92(x), r1=106(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (16, 91) to (167, 189).
; PLAN: r0=16(x1), r1=91(y1), r2=167(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 91
LDI r2, 167
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 68 at center (92, 106).
; PLAN: r0=92(x), r1=106(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 106
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
