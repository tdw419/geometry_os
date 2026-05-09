; DESCRIPTION: Draws a magenta line from (147, 111) to (255, 27).
; PLAN: r0=147(x1), r1=111(y1), r2=255(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 111
LDI r2, 255
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
