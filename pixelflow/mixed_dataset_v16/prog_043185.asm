; DESCRIPTION: Draws a magenta line from (480, 33) to (432, 241).
; PLAN: r0=480(x1), r1=33(y1), r2=432(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 33
LDI r2, 432
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
