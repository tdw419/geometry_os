; DESCRIPTION: Composite: . Then Renders a purple line between points (214, 188) and (84, 39). Then Renders a yellow box of size 47x30 starting at (110, 22).
; PLAN: r0=214(x1), r1=188(y1), r2=84(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=110(x), r1=22(y), r2=47(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (214, 188) and (84, 39).
; PLAN: r0=214(x1), r1=188(y1), r2=84(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 188
LDI r2, 84
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 47x30 starting at (110, 22).
; PLAN: r0=110(x), r1=22(y), r2=47(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 22
LDI r2, 47
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
