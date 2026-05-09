; DESCRIPTION: Draws a black line from (218, 208) to (289, 29).
; PLAN: r0=218(x1), r1=208(y1), r2=289(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 208
LDI r2, 289
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
