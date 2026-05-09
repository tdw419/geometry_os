; DESCRIPTION: Composite: Draws a yellow line from (21, 202) to (3, 143) then Places a blue dot at position (350, 168).
; PLAN: r0=21(x1), r1=202(y1), r2=3(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=168(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 21
LDI r1, 202
LDI r2, 3
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 168
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
