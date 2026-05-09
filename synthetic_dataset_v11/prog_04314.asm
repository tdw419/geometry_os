; DESCRIPTION: Composite: . Then Draws a red line from (225, 56) to (83, 236). Then Places a magenta circle of radius 10 at center (16, 61).
; PLAN: r0=225(x1), r1=56(y1), r2=83(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=16(x), r1=61(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (225, 56) to (83, 236).
; PLAN: r0=225(x1), r1=56(y1), r2=83(x2), r3=236(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 56
LDI r2, 83
LDI r3, 236
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta circle of radius 10 at center (16, 61).
; PLAN: r0=16(x), r1=61(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 61
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
