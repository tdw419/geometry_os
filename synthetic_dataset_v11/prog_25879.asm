; DESCRIPTION: Draws a white line from (138, 44) to (4, 161).
; PLAN: r0=138(x1), r1=44(y1), r2=4(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 44
LDI r2, 4
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
