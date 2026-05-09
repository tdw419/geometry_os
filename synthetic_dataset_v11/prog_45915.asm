; DESCRIPTION: Draws a white line from (254, 236) to (213, 110).
; PLAN: r0=254(x1), r1=236(y1), r2=213(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 236
LDI r2, 213
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
