; DESCRIPTION: Composite: Draws a green line from (7, 65) to (16, 77) then Sets a single orange pixel at (279, 255).
; PLAN: r0=7(x1), r1=65(y1), r2=16(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=255(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 65
LDI r2, 16
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 255
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
