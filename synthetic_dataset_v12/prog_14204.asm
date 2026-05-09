; DESCRIPTION: Draws a white line from (141, 70) to (445, 51).
; PLAN: r0=141(x1), r1=70(y1), r2=445(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 70
LDI r2, 445
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
