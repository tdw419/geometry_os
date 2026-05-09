; DESCRIPTION: Composite: Renders a cyan line between points (373, 52) and (445, 232) then Places a cyan dot at position (287, 29).
; PLAN: r0=373(x1), r1=52(y1), r2=445(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=29(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 52
LDI r2, 445
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 29
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
