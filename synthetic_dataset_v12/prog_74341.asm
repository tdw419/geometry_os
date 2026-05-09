; DESCRIPTION: Composite: Renders a red line between points (315, 191) and (90, 194) then Places a red dot at position (59, 133).
; PLAN: r0=315(x1), r1=191(y1), r2=90(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=133(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 315
LDI r1, 191
LDI r2, 90
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 133
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
