; DESCRIPTION: Draws a magenta line from (218, 126) to (180, 31).
; PLAN: r0=218(x1), r1=126(y1), r2=180(x2), r3=31(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 126
LDI r2, 180
LDI r3, 31
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
