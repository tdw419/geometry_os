; DESCRIPTION: Draws a black line from (383, 138) to (307, 218).
; PLAN: r0=383(x1), r1=138(y1), r2=307(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 138
LDI r2, 307
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
