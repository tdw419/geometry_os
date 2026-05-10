; DESCRIPTION: Draws a black line from (279, 21) to (330, 46).
; PLAN: r0=279(x1), r1=21(y1), r2=330(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 21
LDI r2, 330
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
