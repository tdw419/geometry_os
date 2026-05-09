; DESCRIPTION: Draws a blue line from (82, 196) to (137, 56).
; PLAN: r0=82(x1), r1=196(y1), r2=137(x2), r3=56(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 196
LDI r2, 137
LDI r3, 56
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
