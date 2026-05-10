; DESCRIPTION: Composite: Draws a cyan line from (388, 127) to (57, 116) then Places a black dot at position (341, 102).
; PLAN: r0=388(x1), r1=127(y1), r2=57(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=102(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 388
LDI r1, 127
LDI r2, 57
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 102
LDI r7, 0x000000
PSET r5, r6, r7
HALT
