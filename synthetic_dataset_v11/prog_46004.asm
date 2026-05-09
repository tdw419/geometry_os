; DESCRIPTION: Draws a black line from (196, 25) to (165, 143).
; PLAN: r0=196(x1), r1=25(y1), r2=165(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 25
LDI r2, 165
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
