; DESCRIPTION: Draws a white line from (171, 150) to (170, 31).
; PLAN: r0=171(x1), r1=150(y1), r2=170(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 150
LDI r2, 170
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
