; DESCRIPTION: Draws a green line from (250, 137) to (108, 171).
; PLAN: r0=250(x1), r1=137(y1), r2=108(x2), r3=171(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 137
LDI r2, 108
LDI r3, 171
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
