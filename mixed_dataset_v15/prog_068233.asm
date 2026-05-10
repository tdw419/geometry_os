; DESCRIPTION: Composite: Renders a black line between points (416, 92) and (102, 65) then Places a red dot at position (399, 167).
; PLAN: r0=416(x1), r1=92(y1), r2=102(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=167(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 92
LDI r2, 102
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 167
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
