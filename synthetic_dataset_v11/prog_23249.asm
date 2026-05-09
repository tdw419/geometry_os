; DESCRIPTION: Draws a blue line from (149, 27) to (210, 15).
; PLAN: r0=149(x1), r1=27(y1), r2=210(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 27
LDI r2, 210
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
