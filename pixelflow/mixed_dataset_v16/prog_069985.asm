; DESCRIPTION: Composite: Renders a green line between points (83, 205) and (260, 145) then Places a orange dot at position (410, 209).
; PLAN: r0=83(x1), r1=205(y1), r2=260(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=209(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 205
LDI r2, 260
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 209
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
