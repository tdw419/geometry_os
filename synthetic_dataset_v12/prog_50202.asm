; DESCRIPTION: Draws a white line from (367, 98) to (408, 51).
; PLAN: r0=367(x1), r1=98(y1), r2=408(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 98
LDI r2, 408
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
