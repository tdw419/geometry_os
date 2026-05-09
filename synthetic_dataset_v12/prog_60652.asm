; DESCRIPTION: Draws a white line from (283, 133) to (48, 86).
; PLAN: r0=283(x1), r1=133(y1), r2=48(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 133
LDI r2, 48
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
