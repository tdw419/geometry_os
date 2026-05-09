; DESCRIPTION: Draws a black line from (152, 153) to (90, 221).
; PLAN: r0=152(x1), r1=153(y1), r2=90(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 153
LDI r2, 90
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
