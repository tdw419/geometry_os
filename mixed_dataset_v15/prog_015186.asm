; DESCRIPTION: Composite: Sets a single black pixel at (96, 143) then Renders a blue line between points (510, 57) and (299, 208).
; PLAN: r0=96(x), r1=143(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=510(x1), r6=57(y1), r7=299(x2), r8=208(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 143
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 510
LDI r6, 57
LDI r7, 299
LDI r8, 208
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
