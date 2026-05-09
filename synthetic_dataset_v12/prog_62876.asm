; DESCRIPTION: Composite: Renders a white line between points (134, 221) and (352, 58) then Sets a single black pixel at (240, 87).
; PLAN: r0=134(x1), r1=221(y1), r2=352(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=87(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 134
LDI r1, 221
LDI r2, 352
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 87
LDI r7, 0x000000
PSET r5, r6, r7
HALT
