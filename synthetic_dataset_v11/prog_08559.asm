; DESCRIPTION: Draws a magenta line from (65, 25) to (209, 38).
; PLAN: r0=65(x1), r1=25(y1), r2=209(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 25
LDI r2, 209
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
