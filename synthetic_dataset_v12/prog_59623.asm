; DESCRIPTION: Draws a green line from (165, 63) to (79, 226).
; PLAN: r0=165(x1), r1=63(y1), r2=79(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 63
LDI r2, 79
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
