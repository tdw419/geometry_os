; DESCRIPTION: Composite: Places a black line segment connecting (269, 127) to (477, 160) then Places a magenta dot at position (33, 243).
; PLAN: r0=269(x1), r1=127(y1), r2=477(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=243(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 269
LDI r1, 127
LDI r2, 477
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 243
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
