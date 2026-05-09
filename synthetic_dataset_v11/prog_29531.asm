; DESCRIPTION: Draws a white line from (243, 66) to (52, 169).
; PLAN: r0=243(x1), r1=66(y1), r2=52(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 66
LDI r2, 52
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
