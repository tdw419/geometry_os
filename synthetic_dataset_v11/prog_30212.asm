; DESCRIPTION: Composite: . Then Renders a red line between points (113, 103) and (195, 133). Then Renders a yellow disk with center (62, 148) and radius 57.
; PLAN: r0=113(x1), r1=103(y1), r2=195(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=148(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red line between points (113, 103) and (195, 133).
; PLAN: r0=113(x1), r1=103(y1), r2=195(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 103
LDI r2, 195
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (62, 148) and radius 57.
; PLAN: r0=62(x), r1=148(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 148
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
