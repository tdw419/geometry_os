; DESCRIPTION: Draws a white line from (107, 107) to (458, 193).
; PLAN: r0=107(x1), r1=107(y1), r2=458(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 107
LDI r2, 458
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
