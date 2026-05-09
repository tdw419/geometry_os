; DESCRIPTION: Draws a black line from (302, 210) to (486, 152).
; PLAN: r0=302(x1), r1=210(y1), r2=486(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 210
LDI r2, 486
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
