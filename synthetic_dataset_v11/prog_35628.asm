; DESCRIPTION: Draws a black line from (198, 241) to (213, 86).
; PLAN: r0=198(x1), r1=241(y1), r2=213(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 241
LDI r2, 213
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
