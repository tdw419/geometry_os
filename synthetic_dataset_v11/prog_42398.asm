; DESCRIPTION: Composite: . Then Renders a blue disk with center (189, 111) and radius 61. Then Renders a cyan line between points (142, 70) and (157, 171).
; PLAN: r0=189(x), r1=111(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=142(x1), r1=70(y1), r2=157(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (189, 111) and radius 61.
; PLAN: r0=189(x), r1=111(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 111
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (142, 70) and (157, 171).
; PLAN: r0=142(x1), r1=70(y1), r2=157(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 70
LDI r2, 157
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
