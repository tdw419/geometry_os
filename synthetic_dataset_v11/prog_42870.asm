; DESCRIPTION: Draws a white line from (177, 107) to (96, 14).
; PLAN: r0=177(x1), r1=107(y1), r2=96(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 107
LDI r2, 96
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
