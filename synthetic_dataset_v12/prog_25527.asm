; DESCRIPTION: Composite: Draws a magenta line from (354, 6) to (294, 157) then Sets a single cyan pixel at (187, 133).
; PLAN: r0=354(x1), r1=6(y1), r2=294(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=133(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 6
LDI r2, 294
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 133
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
