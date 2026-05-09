; DESCRIPTION: Draws a blue line from (347, 48) to (398, 128).
; PLAN: r0=347(x1), r1=48(y1), r2=398(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 48
LDI r2, 398
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
