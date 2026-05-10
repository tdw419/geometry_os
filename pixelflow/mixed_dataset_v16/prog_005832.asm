; DESCRIPTION: Draws a black line from (400, 234) to (220, 86).
; PLAN: r0=400(x1), r1=234(y1), r2=220(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 234
LDI r2, 220
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
