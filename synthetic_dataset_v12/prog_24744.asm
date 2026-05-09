; DESCRIPTION: Draws a black line from (206, 70) to (317, 46).
; PLAN: r0=206(x1), r1=70(y1), r2=317(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 70
LDI r2, 317
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
