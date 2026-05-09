; DESCRIPTION: Composite: . Then Draws a red circle centered at (34, 162) with radius 13. Then Places a cyan line segment connecting (89, 124) to (216, 245).
; PLAN: r0=34(x), r1=162(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=89(x1), r1=124(y1), r2=216(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red circle centered at (34, 162) with radius 13.
; PLAN: r0=34(x), r1=162(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 162
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (89, 124) to (216, 245).
; PLAN: r0=89(x1), r1=124(y1), r2=216(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 124
LDI r2, 216
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
