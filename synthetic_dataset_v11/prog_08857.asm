; DESCRIPTION: Composite: . Then Draws a purple circle centered at (216, 177) with radius 14. Then Places a cyan line segment connecting (135, 149) to (144, 142).
; PLAN: r0=216(x), r1=177(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=135(x1), r1=149(y1), r2=144(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (216, 177) with radius 14.
; PLAN: r0=216(x), r1=177(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 177
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (135, 149) to (144, 142).
; PLAN: r0=135(x1), r1=149(y1), r2=144(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 149
LDI r2, 144
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
