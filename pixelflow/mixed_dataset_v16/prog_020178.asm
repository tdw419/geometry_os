; DESCRIPTION: Draws a white line from (352, 45) to (444, 193).
; PLAN: r0=352(x1), r1=45(y1), r2=444(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 45
LDI r2, 444
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
