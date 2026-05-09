; DESCRIPTION: Draws a magenta line from (237, 20) to (204, 128).
; PLAN: r0=237(x1), r1=20(y1), r2=204(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 20
LDI r2, 204
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
