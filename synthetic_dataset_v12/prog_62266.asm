; DESCRIPTION: Draws a black line from (236, 146) to (260, 16).
; PLAN: r0=236(x1), r1=146(y1), r2=260(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 146
LDI r2, 260
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
