; DESCRIPTION: Draws a black line from (260, 168) to (305, 250).
; PLAN: r0=260(x1), r1=168(y1), r2=305(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 168
LDI r2, 305
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
