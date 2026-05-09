; DESCRIPTION: Composite: Draws a orange line from (34, 103) to (428, 254) then Sets a single cyan pixel at (415, 125).
; PLAN: r0=34(x1), r1=103(y1), r2=428(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=415(x), r6=125(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 34
LDI r1, 103
LDI r2, 428
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 125
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
