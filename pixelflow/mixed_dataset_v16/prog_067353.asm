; DESCRIPTION: Draws a magenta line from (417, 52) to (128, 218).
; PLAN: r0=417(x1), r1=52(y1), r2=128(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 52
LDI r2, 128
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
