; DESCRIPTION: Draws a white line from (80, 11) to (392, 73).
; PLAN: r0=80(x1), r1=11(y1), r2=392(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 11
LDI r2, 392
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
