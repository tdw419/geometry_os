; DESCRIPTION: Composite: Renders a white line between points (146, 58) and (297, 57) then Places a orange dot at position (139, 184).
; PLAN: r0=146(x1), r1=58(y1), r2=297(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=184(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 58
LDI r2, 297
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 184
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
