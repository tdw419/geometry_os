; DESCRIPTION: Draws a magenta line from (48, 38) to (240, 132).
; PLAN: r0=48(x1), r1=38(y1), r2=240(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 38
LDI r2, 240
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
