; DESCRIPTION: Composite: Places a black dot at position (430, 50) then Renders a blue line between points (478, 175) and (28, 42).
; PLAN: r0=430(x), r1=50(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=478(x1), r6=175(y1), r7=28(x2), r8=42(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 50
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 478
LDI r6, 175
LDI r7, 28
LDI r8, 42
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
