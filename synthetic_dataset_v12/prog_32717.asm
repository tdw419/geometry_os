; DESCRIPTION: Composite: Draws a magenta line from (205, 211) to (156, 16) then Places a purple dot at position (214, 53).
; PLAN: r0=205(x1), r1=211(y1), r2=156(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=53(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 211
LDI r2, 156
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 53
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
