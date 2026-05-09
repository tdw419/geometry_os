; DESCRIPTION: Draws a white line from (492, 54) to (94, 117).
; PLAN: r0=492(x1), r1=54(y1), r2=94(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 54
LDI r2, 94
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
