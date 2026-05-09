; DESCRIPTION: Composite: . Then Draws a cyan line from (29, 232) to (129, 56). Then Renders a white disk with center (60, 58) and radius 20.
; PLAN: r0=29(x1), r1=232(y1), r2=129(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=60(x), r1=58(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (29, 232) to (129, 56).
; PLAN: r0=29(x1), r1=232(y1), r2=129(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 232
LDI r2, 129
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (60, 58) and radius 20.
; PLAN: r0=60(x), r1=58(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 58
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
