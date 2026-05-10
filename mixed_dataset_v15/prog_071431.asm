; DESCRIPTION: Draws a white line from (505, 107) to (510, 33).
; PLAN: r0=505(x1), r1=107(y1), r2=510(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 107
LDI r2, 510
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
