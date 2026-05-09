; DESCRIPTION: Composite: . Then Renders a magenta line between points (211, 186) and (55, 161). Then Places a yellow circle of radius 50 at center (199, 186).
; PLAN: r0=211(x1), r1=186(y1), r2=55(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=199(x), r1=186(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (211, 186) and (55, 161).
; PLAN: r0=211(x1), r1=186(y1), r2=55(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 186
LDI r2, 55
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 50 at center (199, 186).
; PLAN: r0=199(x), r1=186(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 186
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
