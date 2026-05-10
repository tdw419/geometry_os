; DESCRIPTION: Composite: Creates a red circular shape at (211, 169) with radius 62 then Renders a white line between points (11, 173) and (382, 228) then Places a purple dot at position (503, 187).
; PLAN: r0=211(x), r1=169(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x1), r6=173(y1), r7=382(x2), r8=228(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=503(x), r11=187(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 169
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 173
LDI r7, 382
LDI r8, 228
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 503
LDI r11, 187
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
