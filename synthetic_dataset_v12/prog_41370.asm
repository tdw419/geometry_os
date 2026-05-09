; DESCRIPTION: Draws a magenta line from (208, 96) to (176, 225).
; PLAN: r0=208(x1), r1=96(y1), r2=176(x2), r3=225(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 96
LDI r2, 176
LDI r3, 225
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
