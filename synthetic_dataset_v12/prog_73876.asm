; DESCRIPTION: Draws a magenta line from (295, 143) to (341, 208).
; PLAN: r0=295(x1), r1=143(y1), r2=341(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 143
LDI r2, 341
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
