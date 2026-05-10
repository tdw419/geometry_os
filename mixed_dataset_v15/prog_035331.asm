; DESCRIPTION: Composite: Draws a red line from (325, 180) to (70, 57) then Places a cyan dot at position (7, 1).
; PLAN: r0=325(x1), r1=180(y1), r2=70(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=1(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 325
LDI r1, 180
LDI r2, 70
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 1
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
