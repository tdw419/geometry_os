; DESCRIPTION: Draws a white line from (4, 152) to (217, 233).
; PLAN: r0=4(x1), r1=152(y1), r2=217(x2), r3=233(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 152
LDI r2, 217
LDI r3, 233
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
