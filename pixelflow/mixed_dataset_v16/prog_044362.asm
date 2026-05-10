; DESCRIPTION: Draws a blue line from (83, 15) to (487, 32).
; PLAN: r0=83(x1), r1=15(y1), r2=487(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 15
LDI r2, 487
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
