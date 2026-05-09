; DESCRIPTION: Draws a magenta line from (110, 189) to (386, 186).
; PLAN: r0=110(x1), r1=189(y1), r2=386(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 189
LDI r2, 386
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
