; DESCRIPTION: Composite: Draws a orange line from (171, 180) to (231, 52) then Places a white dot at position (293, 167).
; PLAN: r0=171(x1), r1=180(y1), r2=231(x2), r3=52(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=167(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 180
LDI r2, 231
LDI r3, 52
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 167
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
