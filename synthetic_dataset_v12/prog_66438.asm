; DESCRIPTION: Draws a magenta line from (365, 176) to (219, 214).
; PLAN: r0=365(x1), r1=176(y1), r2=219(x2), r3=214(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 176
LDI r2, 219
LDI r3, 214
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
