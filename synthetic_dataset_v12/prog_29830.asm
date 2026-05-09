; DESCRIPTION: Composite: Places a green line segment connecting (293, 133) to (84, 177) then Sets a single magenta pixel at (108, 198).
; PLAN: r0=293(x1), r1=133(y1), r2=84(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=198(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 133
LDI r2, 84
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 198
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
