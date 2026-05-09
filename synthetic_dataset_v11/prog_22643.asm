; DESCRIPTION: Composite: . Then Renders a white line between points (215, 250) and (61, 228). Then Renders a black disk with center (70, 204) and radius 15.
; PLAN: r0=215(x1), r1=250(y1), r2=61(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=70(x), r1=204(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (215, 250) and (61, 228).
; PLAN: r0=215(x1), r1=250(y1), r2=61(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 250
LDI r2, 61
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (70, 204) and radius 15.
; PLAN: r0=70(x), r1=204(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 204
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
