; DESCRIPTION: Composite: . Then Renders a white disk with center (56, 90) and radius 53. Then Places a white line segment connecting (168, 57) to (44, 28).
; PLAN: r0=56(x), r1=90(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=168(x1), r1=57(y1), r2=44(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (56, 90) and radius 53.
; PLAN: r0=56(x), r1=90(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 90
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (168, 57) to (44, 28).
; PLAN: r0=168(x1), r1=57(y1), r2=44(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 57
LDI r2, 44
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
