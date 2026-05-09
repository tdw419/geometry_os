; DESCRIPTION: Draws a blue line from (329, 205) to (383, 51).
; PLAN: r0=329(x1), r1=205(y1), r2=383(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 205
LDI r2, 383
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
