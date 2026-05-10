; DESCRIPTION: Composite: Places a purple dot at position (253, 229) then Renders a blue line between points (82, 115) and (428, 76).
; PLAN: r0=253(x), r1=229(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=82(x1), r6=115(y1), r7=428(x2), r8=76(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 229
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 82
LDI r6, 115
LDI r7, 428
LDI r8, 76
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
