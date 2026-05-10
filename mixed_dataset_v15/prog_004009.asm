; DESCRIPTION: Draws a black line from (502, 107) to (198, 163).
; PLAN: r0=502(x1), r1=107(y1), r2=198(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 107
LDI r2, 198
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
