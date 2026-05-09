; DESCRIPTION: Draws a orange line from (235, 146) to (160, 220).
; PLAN: r0=235(x1), r1=146(y1), r2=160(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 146
LDI r2, 160
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
