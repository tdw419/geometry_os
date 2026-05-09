; DESCRIPTION: Composite: Places a white dot at position (233, 209) then Renders a orange line between points (494, 126) and (223, 124).
; PLAN: r0=233(x), r1=209(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=494(x1), r6=126(y1), r7=223(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 233
LDI r1, 209
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 494
LDI r6, 126
LDI r7, 223
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
