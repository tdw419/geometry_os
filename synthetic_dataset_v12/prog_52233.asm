; DESCRIPTION: Composite: Renders a green line between points (333, 69) and (59, 111) then Places a cyan dot at position (83, 205).
; PLAN: r0=333(x1), r1=69(y1), r2=59(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=205(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 69
LDI r2, 59
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 205
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
