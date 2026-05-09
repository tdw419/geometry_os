; DESCRIPTION: Composite: . Then Places a red circle of radius 27 at center (110, 111). Then Draws a blue line from (55, 90) to (220, 230).
; PLAN: r0=110(x), r1=111(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=55(x1), r1=90(y1), r2=220(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 27 at center (110, 111).
; PLAN: r0=110(x), r1=111(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 111
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (55, 90) to (220, 230).
; PLAN: r0=55(x1), r1=90(y1), r2=220(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 90
LDI r2, 220
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
