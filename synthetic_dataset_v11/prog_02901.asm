; DESCRIPTION: Composite: . Then Places a red circle of radius 72 at center (97, 77). Then Draws a white line from (242, 77) to (44, 150).
; PLAN: r0=97(x), r1=77(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=242(x1), r1=77(y1), r2=44(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 72 at center (97, 77).
; PLAN: r0=97(x), r1=77(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 77
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white line from (242, 77) to (44, 150).
; PLAN: r0=242(x1), r1=77(y1), r2=44(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 77
LDI r2, 44
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
