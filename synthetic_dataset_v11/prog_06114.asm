; DESCRIPTION: Draws a white line from (236, 184) to (132, 134).
; PLAN: r0=236(x1), r1=184(y1), r2=132(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 184
LDI r2, 132
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
