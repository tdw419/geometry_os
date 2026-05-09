; DESCRIPTION: Draws a white line from (365, 107) to (292, 124).
; PLAN: r0=365(x1), r1=107(y1), r2=292(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 107
LDI r2, 292
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
