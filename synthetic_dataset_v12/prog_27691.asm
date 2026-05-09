; DESCRIPTION: Draws a white line from (187, 169) to (36, 164).
; PLAN: r0=187(x1), r1=169(y1), r2=36(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 169
LDI r2, 36
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
