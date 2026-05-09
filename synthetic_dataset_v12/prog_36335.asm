; DESCRIPTION: Draws a blue line from (465, 34) to (398, 234).
; PLAN: r0=465(x1), r1=34(y1), r2=398(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 34
LDI r2, 398
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
