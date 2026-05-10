; DESCRIPTION: Composite: Draws a yellow line from (322, 232) to (228, 242) then Places a blue dot at position (132, 84).
; PLAN: r0=322(x1), r1=232(y1), r2=228(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=84(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 232
LDI r2, 228
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 84
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
