; DESCRIPTION: Draws a magenta line from (76, 196) to (16, 211).
; PLAN: r0=76(x1), r1=196(y1), r2=16(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 196
LDI r2, 16
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
