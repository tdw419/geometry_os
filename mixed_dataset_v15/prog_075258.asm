; DESCRIPTION: Composite: Draws a white line from (434, 43) to (55, 65) then Places a red dot at position (387, 248).
; PLAN: r0=434(x1), r1=43(y1), r2=55(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=248(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 434
LDI r1, 43
LDI r2, 55
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 248
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
