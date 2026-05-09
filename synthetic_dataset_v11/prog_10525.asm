; DESCRIPTION: Draws a white line from (137, 180) to (120, 221).
; PLAN: r0=137(x1), r1=180(y1), r2=120(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 180
LDI r2, 120
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
