; DESCRIPTION: Composite: . Then Renders a white line between points (244, 150) and (240, 114). Then Draws a green circle centered at (62, 84) with radius 61.
; PLAN: r0=244(x1), r1=150(y1), r2=240(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=62(x), r1=84(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (244, 150) and (240, 114).
; PLAN: r0=244(x1), r1=150(y1), r2=240(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 150
LDI r2, 240
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (62, 84) with radius 61.
; PLAN: r0=62(x), r1=84(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 84
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
