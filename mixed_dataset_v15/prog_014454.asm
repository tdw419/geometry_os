; DESCRIPTION: Composite: Draws a black line from (83, 220) to (38, 115) then Places a red dot at position (217, 193).
; PLAN: r0=83(x1), r1=220(y1), r2=38(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=193(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 220
LDI r2, 38
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 193
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
