; DESCRIPTION: Composite: Places a magenta line segment connecting (276, 236) to (274, 149) then Places a blue dot at position (336, 137).
; PLAN: r0=276(x1), r1=236(y1), r2=274(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=137(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 276
LDI r1, 236
LDI r2, 274
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 137
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
