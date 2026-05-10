; DESCRIPTION: Draws a magenta line from (426, 31) to (392, 53).
; PLAN: r0=426(x1), r1=31(y1), r2=392(x2), r3=53(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 31
LDI r2, 392
LDI r3, 53
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
