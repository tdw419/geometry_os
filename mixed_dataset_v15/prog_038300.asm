; DESCRIPTION: Composite: Renders a white line between points (261, 161) and (107, 226) then Creates a red circular shape at (304, 78) with radius 36.
; PLAN: r0=261(x1), r1=161(y1), r2=107(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=78(y), r7=36(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 161
LDI r2, 107
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 78
LDI r7, 36
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
