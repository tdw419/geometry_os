; DESCRIPTION: Composite: . Then Draws a green line from (95, 200) to (37, 129). Then Places a red circle of radius 72 at center (92, 102).
; PLAN: r0=95(x1), r1=200(y1), r2=37(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=92(x), r1=102(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a green line from (95, 200) to (37, 129).
; PLAN: r0=95(x1), r1=200(y1), r2=37(x2), r3=129(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 200
LDI r2, 37
LDI r3, 129
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 72 at center (92, 102).
; PLAN: r0=92(x), r1=102(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 102
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
