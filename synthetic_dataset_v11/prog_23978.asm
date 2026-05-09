; DESCRIPTION: Composite: . Then Places a red circle of radius 56 at center (187, 133). Then Places a red line segment connecting (160, 172) to (244, 29).
; PLAN: r0=187(x), r1=133(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=160(x1), r1=172(y1), r2=244(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 56 at center (187, 133).
; PLAN: r0=187(x), r1=133(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 133
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (160, 172) to (244, 29).
; PLAN: r0=160(x1), r1=172(y1), r2=244(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 172
LDI r2, 244
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
