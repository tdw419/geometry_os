; DESCRIPTION: Places a black line segment connecting (230, 205) to (196, 82).
; PLAN: r0=230(x1), r1=205(y1), r2=196(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 205
LDI r2, 196
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
