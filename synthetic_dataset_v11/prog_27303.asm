; DESCRIPTION: Draws a magenta line from (72, 143) to (209, 18).
; PLAN: r0=72(x1), r1=143(y1), r2=209(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 143
LDI r2, 209
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
