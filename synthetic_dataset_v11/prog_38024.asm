; DESCRIPTION: Composite: . Then Places a orange circle of radius 53 at center (129, 183). Then Renders a magenta line between points (168, 6) and (85, 244).
; PLAN: r0=129(x), r1=183(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=168(x1), r1=6(y1), r2=85(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 53 at center (129, 183).
; PLAN: r0=129(x), r1=183(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 183
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (168, 6) and (85, 244).
; PLAN: r0=168(x1), r1=6(y1), r2=85(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 6
LDI r2, 85
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
