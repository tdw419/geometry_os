; DESCRIPTION: Draws a magenta line from (241, 164) to (173, 22).
; PLAN: r0=241(x1), r1=164(y1), r2=173(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 164
LDI r2, 173
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
