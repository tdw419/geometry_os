; DESCRIPTION: Composite: Draws a orange line from (7, 246) to (124, 114) then Places a white dot at position (224, 205).
; PLAN: r0=7(x1), r1=246(y1), r2=124(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=205(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 7
LDI r1, 246
LDI r2, 124
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 205
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
