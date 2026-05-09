; DESCRIPTION: Draws a black line from (219, 69) to (487, 226).
; PLAN: r0=219(x1), r1=69(y1), r2=487(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 69
LDI r2, 487
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
