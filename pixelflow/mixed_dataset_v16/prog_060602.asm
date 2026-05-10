; DESCRIPTION: Composite: Draws a blue line from (224, 43) to (11, 143) then Places a white dot at position (197, 87).
; PLAN: r0=224(x1), r1=43(y1), r2=11(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=87(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 224
LDI r1, 43
LDI r2, 11
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 87
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
