; DESCRIPTION: Draws a black line from (486, 154) to (46, 108).
; PLAN: r0=486(x1), r1=154(y1), r2=46(x2), r3=108(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 154
LDI r2, 46
LDI r3, 108
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
