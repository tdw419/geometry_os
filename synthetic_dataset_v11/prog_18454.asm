; DESCRIPTION: Draws a white line from (18, 248) to (94, 108).
; PLAN: r0=18(x1), r1=248(y1), r2=94(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 248
LDI r2, 94
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
