; DESCRIPTION: Draws a white line from (448, 168) to (45, 28).
; PLAN: r0=448(x1), r1=168(y1), r2=45(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 168
LDI r2, 45
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
