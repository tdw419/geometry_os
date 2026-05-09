; DESCRIPTION: Draws a magenta line from (125, 111) to (225, 198).
; PLAN: r0=125(x1), r1=111(y1), r2=225(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 111
LDI r2, 225
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
