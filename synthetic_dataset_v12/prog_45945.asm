; DESCRIPTION: Draws a blue line from (410, 44) to (275, 112).
; PLAN: r0=410(x1), r1=44(y1), r2=275(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 44
LDI r2, 275
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
