; DESCRIPTION: Draws a white line from (58, 9) to (141, 146).
; PLAN: r0=58(x1), r1=9(y1), r2=141(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 9
LDI r2, 141
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
