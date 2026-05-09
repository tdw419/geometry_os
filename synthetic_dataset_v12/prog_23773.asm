; DESCRIPTION: Draws a white line from (14, 241) to (264, 180).
; PLAN: r0=14(x1), r1=241(y1), r2=264(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 241
LDI r2, 264
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
