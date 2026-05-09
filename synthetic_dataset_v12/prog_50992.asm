; DESCRIPTION: Draws a white line from (500, 231) to (293, 126).
; PLAN: r0=500(x1), r1=231(y1), r2=293(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 231
LDI r2, 293
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
