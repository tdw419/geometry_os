; DESCRIPTION: Draws a blue line from (82, 107) to (327, 196).
; PLAN: r0=82(x1), r1=107(y1), r2=327(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 107
LDI r2, 327
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
