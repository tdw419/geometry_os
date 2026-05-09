; DESCRIPTION: Composite: Places a magenta dot at position (288, 224) then Draws a green line from (293, 87) to (361, 160).
; PLAN: r0=288(x), r1=224(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=293(x1), r6=87(y1), r7=361(x2), r8=160(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 224
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 293
LDI r6, 87
LDI r7, 361
LDI r8, 160
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
