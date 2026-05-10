; DESCRIPTION: Composite: Places a purple dot at position (255, 19) then Renders a blue line between points (3, 93) and (212, 33).
; PLAN: r0=255(x), r1=19(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=3(x1), r6=93(y1), r7=212(x2), r8=33(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 19
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 3
LDI r6, 93
LDI r7, 212
LDI r8, 33
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
