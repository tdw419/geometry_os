; DESCRIPTION: Composite: . Then Places a cyan circle of radius 25 at center (75, 72). Then Draws a blue line from (61, 35) to (154, 229).
; PLAN: r0=75(x), r1=72(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=61(x1), r1=35(y1), r2=154(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan circle of radius 25 at center (75, 72).
; PLAN: r0=75(x), r1=72(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 72
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (61, 35) to (154, 229).
; PLAN: r0=61(x1), r1=35(y1), r2=154(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 35
LDI r2, 154
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
