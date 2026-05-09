; DESCRIPTION: Draws a magenta line from (178, 126) to (1, 196).
; PLAN: r0=178(x1), r1=126(y1), r2=1(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 126
LDI r2, 1
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
