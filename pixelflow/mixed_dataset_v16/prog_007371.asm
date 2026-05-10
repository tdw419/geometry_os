; DESCRIPTION: Composite: Draws a magenta line from (392, 232) to (14, 138) then Places a green dot at position (192, 141).
; PLAN: r0=392(x1), r1=232(y1), r2=14(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=141(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 392
LDI r1, 232
LDI r2, 14
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 141
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
