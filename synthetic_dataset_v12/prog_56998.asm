; DESCRIPTION: Composite: Draws a green line from (23, 51) to (360, 205) then Sets a single white pixel at (394, 187).
; PLAN: r0=23(x1), r1=51(y1), r2=360(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=187(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 51
LDI r2, 360
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 187
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
