; DESCRIPTION: Draws a purple line from (449, 94) to (239, 234).
; PLAN: r0=449(x1), r1=94(y1), r2=239(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 94
LDI r2, 239
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
