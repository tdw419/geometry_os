; DESCRIPTION: Composite: Renders a magenta line between points (438, 207) and (434, 25) then Sets a single green pixel at (206, 39).
; PLAN: r0=438(x1), r1=207(y1), r2=434(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=39(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 438
LDI r1, 207
LDI r2, 434
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 39
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
