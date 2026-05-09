; DESCRIPTION: Draws a yellow line from (308, 46) to (313, 141).
; PLAN: r0=308(x1), r1=46(y1), r2=313(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 46
LDI r2, 313
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
