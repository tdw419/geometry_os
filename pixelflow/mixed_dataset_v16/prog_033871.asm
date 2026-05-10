; DESCRIPTION: Draws a white line from (363, 180) to (319, 202).
; PLAN: r0=363(x1), r1=180(y1), r2=319(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 180
LDI r2, 319
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
