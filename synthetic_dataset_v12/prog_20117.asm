; DESCRIPTION: Composite: Sets a single cyan pixel at (234, 73) then Renders a white line between points (72, 119) and (120, 226).
; PLAN: r0=234(x), r1=73(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=72(x1), r6=119(y1), r7=120(x2), r8=226(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 73
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 119
LDI r7, 120
LDI r8, 226
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
