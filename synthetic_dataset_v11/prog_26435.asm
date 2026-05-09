; DESCRIPTION: Composite: . Then Draws a cyan circle centered at (206, 36) with radius 33. Then Places a blue line segment connecting (250, 168) to (29, 97).
; PLAN: r0=206(x), r1=36(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=250(x1), r1=168(y1), r2=29(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan circle centered at (206, 36) with radius 33.
; PLAN: r0=206(x), r1=36(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 36
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (250, 168) to (29, 97).
; PLAN: r0=250(x1), r1=168(y1), r2=29(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 168
LDI r2, 29
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
