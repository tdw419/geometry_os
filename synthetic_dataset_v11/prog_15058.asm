; DESCRIPTION: Composite: . Then Renders a white disk with center (190, 184) and radius 48. Then Places a green line segment connecting (75, 18) to (55, 173).
; PLAN: r0=190(x), r1=184(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=75(x1), r1=18(y1), r2=55(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (190, 184) and radius 48.
; PLAN: r0=190(x), r1=184(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 184
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a green line segment connecting (75, 18) to (55, 173).
; PLAN: r0=75(x1), r1=18(y1), r2=55(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 18
LDI r2, 55
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
