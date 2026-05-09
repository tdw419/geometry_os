; DESCRIPTION: Draws a black line from (248, 113) to (168, 160).
; PLAN: r0=248(x1), r1=113(y1), r2=168(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 113
LDI r2, 168
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
