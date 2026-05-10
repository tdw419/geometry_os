; DESCRIPTION: Composite: Draws a white line from (172, 74) to (307, 232) then Places a black dot at position (396, 62).
; PLAN: r0=172(x1), r1=74(y1), r2=307(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=62(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 74
LDI r2, 307
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 62
LDI r7, 0x000000
PSET r5, r6, r7
HALT
