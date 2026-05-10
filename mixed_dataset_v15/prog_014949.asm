; DESCRIPTION: Draws a black line from (57, 28) to (222, 125).
; PLAN: r0=57(x1), r1=28(y1), r2=222(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 28
LDI r2, 222
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
