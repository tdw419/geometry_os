; DESCRIPTION: Composite: Renders a red disk with center (85, 196) and radius 12 then Renders a white line between points (223, 215) and (433, 2).
; PLAN: r0=85(x), r1=196(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x1), r6=215(y1), r7=433(x2), r8=2(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 85
LDI r1, 196
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 215
LDI r7, 433
LDI r8, 2
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
