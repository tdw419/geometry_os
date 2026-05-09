; DESCRIPTION: Composite: Draws a green line from (205, 208) to (13, 181) then Places a orange dot at position (234, 212).
; PLAN: r0=205(x1), r1=208(y1), r2=13(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=212(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 208
LDI r2, 13
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 212
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
