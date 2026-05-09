; DESCRIPTION: Composite: Renders a magenta line between points (397, 142) and (59, 58) then Sets a single cyan pixel at (351, 23).
; PLAN: r0=397(x1), r1=142(y1), r2=59(x2), r3=58(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=23(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 397
LDI r1, 142
LDI r2, 59
LDI r3, 58
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 23
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
