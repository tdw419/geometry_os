; DESCRIPTION: Draws a black line from (105, 248) to (417, 117).
; PLAN: r0=105(x1), r1=248(y1), r2=417(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 248
LDI r2, 417
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
