; DESCRIPTION: Draws a white line from (26, 107) to (461, 139).
; PLAN: r0=26(x1), r1=107(y1), r2=461(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 107
LDI r2, 461
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
