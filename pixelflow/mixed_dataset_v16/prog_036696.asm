; DESCRIPTION: Composite: Places a blue dot at position (409, 196) then Renders a yellow line between points (262, 155) and (495, 60).
; PLAN: r0=409(x), r1=196(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=262(x1), r6=155(y1), r7=495(x2), r8=60(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 196
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 262
LDI r6, 155
LDI r7, 495
LDI r8, 60
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
