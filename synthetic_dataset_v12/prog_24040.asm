; DESCRIPTION: Draws a black line from (437, 248) to (329, 214).
; PLAN: r0=437(x1), r1=248(y1), r2=329(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 248
LDI r2, 329
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
