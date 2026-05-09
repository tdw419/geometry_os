; DESCRIPTION: Draws a magenta line from (280, 209) to (309, 44).
; PLAN: r0=280(x1), r1=209(y1), r2=309(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 209
LDI r2, 309
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
