; DESCRIPTION: Composite: . Then Draws a blue line from (52, 10) to (174, 119). Then Creates a cyan circular shape at (125, 102) with radius 46.
; PLAN: r0=52(x1), r1=10(y1), r2=174(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=125(x), r1=102(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue line from (52, 10) to (174, 119).
; PLAN: r0=52(x1), r1=10(y1), r2=174(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 10
LDI r2, 174
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan circular shape at (125, 102) with radius 46.
; PLAN: r0=125(x), r1=102(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 102
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
