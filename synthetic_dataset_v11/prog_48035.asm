; DESCRIPTION: Draws a white line from (251, 109) to (124, 231).
; PLAN: r0=251(x1), r1=109(y1), r2=124(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 109
LDI r2, 124
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
