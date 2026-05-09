; DESCRIPTION: Draws a magenta line from (285, 62) to (206, 161).
; PLAN: r0=285(x1), r1=62(y1), r2=206(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 62
LDI r2, 206
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
