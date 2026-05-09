; DESCRIPTION: Composite: . Then Renders a cyan line between points (54, 50) and (199, 175). Then Draws a green circle centered at (161, 48) with radius 45.
; PLAN: r0=54(x1), r1=50(y1), r2=199(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=161(x), r1=48(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (54, 50) and (199, 175).
; PLAN: r0=54(x1), r1=50(y1), r2=199(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 50
LDI r2, 199
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (161, 48) with radius 45.
; PLAN: r0=161(x), r1=48(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 48
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
