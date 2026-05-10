; DESCRIPTION: Draws a white line from (44, 18) to (352, 84).
; PLAN: r0=44(x1), r1=18(y1), r2=352(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 18
LDI r2, 352
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
