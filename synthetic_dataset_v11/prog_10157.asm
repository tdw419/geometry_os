; DESCRIPTION: Places a magenta line segment connecting (217, 25) to (36, 178).
; PLAN: r0=217(x1), r1=25(y1), r2=36(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 25
LDI r2, 36
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
