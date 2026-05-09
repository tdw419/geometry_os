; DESCRIPTION: Places a magenta line segment connecting (273, 209) to (307, 253).
; PLAN: r0=273(x1), r1=209(y1), r2=307(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 209
LDI r2, 307
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
