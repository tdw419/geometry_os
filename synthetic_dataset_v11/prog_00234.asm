; DESCRIPTION: Draws a white line from (32, 180) to (90, 155).
; PLAN: r0=32(x1), r1=180(y1), r2=90(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 180
LDI r2, 90
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
