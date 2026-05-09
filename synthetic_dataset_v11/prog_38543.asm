; DESCRIPTION: Draws a black line from (150, 243) to (221, 44).
; PLAN: r0=150(x1), r1=243(y1), r2=221(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 243
LDI r2, 221
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
