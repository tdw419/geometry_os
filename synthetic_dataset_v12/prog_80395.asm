; DESCRIPTION: Draws a black line from (180, 187) to (223, 125).
; PLAN: r0=180(x1), r1=187(y1), r2=223(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 187
LDI r2, 223
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
