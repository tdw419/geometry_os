; DESCRIPTION: Composite: . Then Places a orange circle of radius 76 at center (123, 177). Then Renders a magenta line between points (128, 33) and (200, 157).
; PLAN: r0=123(x), r1=177(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=128(x1), r1=33(y1), r2=200(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 76 at center (123, 177).
; PLAN: r0=123(x), r1=177(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 177
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (128, 33) and (200, 157).
; PLAN: r0=128(x1), r1=33(y1), r2=200(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 33
LDI r2, 200
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
