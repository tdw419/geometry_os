; DESCRIPTION: Composite: Draws a red line from (33, 224) to (231, 64) then Places a orange dot at position (109, 103).
; PLAN: r0=33(x1), r1=224(y1), r2=231(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=103(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 33
LDI r1, 224
LDI r2, 231
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 103
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
