; DESCRIPTION: Draws a magenta line from (356, 152) to (430, 107).
; PLAN: r0=356(x1), r1=152(y1), r2=430(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 152
LDI r2, 430
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
