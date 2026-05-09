; DESCRIPTION: Composite: . Then Renders a cyan disk with center (75, 199) and radius 50. Then Draws a magenta line from (73, 217) to (112, 35).
; PLAN: r0=75(x), r1=199(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=73(x1), r1=217(y1), r2=112(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan disk with center (75, 199) and radius 50.
; PLAN: r0=75(x), r1=199(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 199
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (73, 217) to (112, 35).
; PLAN: r0=73(x1), r1=217(y1), r2=112(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 217
LDI r2, 112
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
