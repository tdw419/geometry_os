; DESCRIPTION: Draws a red line from (170, 250) to (327, 132).
; PLAN: r0=170(x1), r1=250(y1), r2=327(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 250
LDI r2, 327
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
