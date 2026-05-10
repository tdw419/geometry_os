; DESCRIPTION: Draws a magenta line from (21, 149) to (175, 246).
; PLAN: r0=21(x1), r1=149(y1), r2=175(x2), r3=246(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 149
LDI r2, 175
LDI r3, 246
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
