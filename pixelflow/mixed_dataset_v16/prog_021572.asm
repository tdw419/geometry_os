; DESCRIPTION: Draws a green line from (269, 74) to (266, 174).
; PLAN: r0=269(x1), r1=74(y1), r2=266(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 74
LDI r2, 266
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
