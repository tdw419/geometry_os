; DESCRIPTION: Draws a black line from (289, 111) to (330, 120).
; PLAN: r0=289(x1), r1=111(y1), r2=330(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 111
LDI r2, 330
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
