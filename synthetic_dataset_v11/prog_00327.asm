; DESCRIPTION: Composite: . Then Places a red circle of radius 34 at center (170, 111). Then Renders a blue line between points (37, 73) and (31, 195).
; PLAN: r0=170(x), r1=111(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=37(x1), r1=73(y1), r2=31(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 34 at center (170, 111).
; PLAN: r0=170(x), r1=111(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 111
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (37, 73) and (31, 195).
; PLAN: r0=37(x1), r1=73(y1), r2=31(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 73
LDI r2, 31
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
