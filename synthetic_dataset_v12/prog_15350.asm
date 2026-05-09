; DESCRIPTION: Draws a magenta line from (470, 239) to (448, 164).
; PLAN: r0=470(x1), r1=239(y1), r2=448(x2), r3=164(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 239
LDI r2, 448
LDI r3, 164
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
