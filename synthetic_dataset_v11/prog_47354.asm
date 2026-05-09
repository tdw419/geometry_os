; DESCRIPTION: Draws a white line from (198, 18) to (72, 124).
; PLAN: r0=198(x1), r1=18(y1), r2=72(x2), r3=124(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 18
LDI r2, 72
LDI r3, 124
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
