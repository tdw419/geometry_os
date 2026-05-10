; DESCRIPTION: Draws a black line from (428, 46) to (470, 59).
; PLAN: r0=428(x1), r1=46(y1), r2=470(x2), r3=59(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 46
LDI r2, 470
LDI r3, 59
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
