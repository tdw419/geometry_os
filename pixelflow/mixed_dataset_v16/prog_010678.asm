; DESCRIPTION: Draws a black line from (87, 108) to (313, 48).
; PLAN: r0=87(x1), r1=108(y1), r2=313(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 108
LDI r2, 313
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
