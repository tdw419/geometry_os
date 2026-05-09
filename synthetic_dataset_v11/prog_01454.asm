; DESCRIPTION: Draws a magenta line from (210, 230) to (138, 150).
; PLAN: r0=210(x1), r1=230(y1), r2=138(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 230
LDI r2, 138
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
