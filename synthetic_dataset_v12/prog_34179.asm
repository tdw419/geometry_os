; DESCRIPTION: Draws a magenta line from (385, 213) to (487, 0).
; PLAN: r0=385(x1), r1=213(y1), r2=487(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 213
LDI r2, 487
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
