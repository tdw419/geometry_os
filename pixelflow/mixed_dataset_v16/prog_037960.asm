; DESCRIPTION: Composite: Places a orange dot at position (375, 189) then Renders a black line between points (346, 28) and (311, 174).
; PLAN: r0=375(x), r1=189(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=346(x1), r6=28(y1), r7=311(x2), r8=174(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 189
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 346
LDI r6, 28
LDI r7, 311
LDI r8, 174
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
