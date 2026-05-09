; DESCRIPTION: Draws a magenta line from (168, 255) to (208, 35).
; PLAN: r0=168(x1), r1=255(y1), r2=208(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 255
LDI r2, 208
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
