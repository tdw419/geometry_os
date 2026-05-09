; DESCRIPTION: Composite: . Then Places a red circle of radius 11 at center (218, 189). Then Renders a magenta line between points (174, 231) and (108, 129).
; PLAN: r0=218(x), r1=189(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=174(x1), r1=231(y1), r2=108(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 11 at center (218, 189).
; PLAN: r0=218(x), r1=189(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 189
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta line between points (174, 231) and (108, 129).
; PLAN: r0=174(x1), r1=231(y1), r2=108(x2), r3=129(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 231
LDI r2, 108
LDI r3, 129
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
