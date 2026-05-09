; DESCRIPTION: Composite: Places a red dot at position (408, 21) then Renders a black line between points (306, 64) and (317, 184).
; PLAN: r0=408(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=306(x1), r6=64(y1), r7=317(x2), r8=184(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 21
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 306
LDI r6, 64
LDI r7, 317
LDI r8, 184
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
