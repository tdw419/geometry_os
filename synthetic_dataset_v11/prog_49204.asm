; DESCRIPTION: Composite: . Then Draws a purple circle centered at (136, 194) with radius 29. Then Places a cyan line segment connecting (86, 92) to (47, 231).
; PLAN: r0=136(x), r1=194(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=86(x1), r1=92(y1), r2=47(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (136, 194) with radius 29.
; PLAN: r0=136(x), r1=194(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 194
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (86, 92) to (47, 231).
; PLAN: r0=86(x1), r1=92(y1), r2=47(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 92
LDI r2, 47
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
