; DESCRIPTION: Composite: Draws a cyan line from (61, 71) to (335, 24) then Places a red dot at position (421, 217).
; PLAN: r0=61(x1), r1=71(y1), r2=335(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=217(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 71
LDI r2, 335
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 217
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
