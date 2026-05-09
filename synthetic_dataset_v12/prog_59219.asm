; DESCRIPTION: Draws a yellow line from (437, 205) to (78, 117).
; PLAN: r0=437(x1), r1=205(y1), r2=78(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 205
LDI r2, 78
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
