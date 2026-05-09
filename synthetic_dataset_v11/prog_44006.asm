; DESCRIPTION: Draws a red line from (83, 223) to (71, 37).
; PLAN: r0=83(x1), r1=223(y1), r2=71(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 223
LDI r2, 71
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
