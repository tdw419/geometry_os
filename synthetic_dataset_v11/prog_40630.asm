; DESCRIPTION: Composite: . Then Draws a white line from (220, 145) to (233, 20). Then Places a red circle of radius 14 at center (91, 205).
; PLAN: r0=220(x1), r1=145(y1), r2=233(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=91(x), r1=205(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (220, 145) to (233, 20).
; PLAN: r0=220(x1), r1=145(y1), r2=233(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 145
LDI r2, 233
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 14 at center (91, 205).
; PLAN: r0=91(x), r1=205(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 205
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
