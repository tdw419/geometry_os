; DESCRIPTION: Draws a black line from (49, 47) to (98, 117).
; PLAN: r0=49(x1), r1=47(y1), r2=98(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 47
LDI r2, 98
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
