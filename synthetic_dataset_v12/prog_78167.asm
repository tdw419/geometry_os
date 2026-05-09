; DESCRIPTION: Draws a magenta line from (269, 54) to (152, 71).
; PLAN: r0=269(x1), r1=54(y1), r2=152(x2), r3=71(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 54
LDI r2, 152
LDI r3, 71
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
