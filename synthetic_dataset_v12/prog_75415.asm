; DESCRIPTION: Draws a magenta line from (209, 1) to (387, 132).
; PLAN: r0=209(x1), r1=1(y1), r2=387(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 1
LDI r2, 387
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
