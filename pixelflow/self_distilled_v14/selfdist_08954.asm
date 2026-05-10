; DESCRIPTION: Places a blue 22x45 box at position (317, 39).
; PLAN: r0=317(x), r1=39(y), r2=22(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 39
LDI r2, 22
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
