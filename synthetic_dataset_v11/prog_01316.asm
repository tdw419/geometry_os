; DESCRIPTION: Draws a white line from (205, 187) to (94, 48).
; PLAN: r0=205(x1), r1=187(y1), r2=94(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 187
LDI r2, 94
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
