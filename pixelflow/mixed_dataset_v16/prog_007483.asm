; DESCRIPTION: Composite: Renders a white line between points (228, 146) and (396, 142) then Places a white circle of radius 15 at center (461, 150).
; PLAN: r0=228(x1), r1=146(y1), r2=396(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=461(x), r6=150(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 146
LDI r2, 396
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 150
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
