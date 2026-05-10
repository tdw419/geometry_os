; DESCRIPTION: Draws a magenta line from (293, 206) to (150, 98).
; PLAN: r0=293(x1), r1=206(y1), r2=150(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 206
LDI r2, 150
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
