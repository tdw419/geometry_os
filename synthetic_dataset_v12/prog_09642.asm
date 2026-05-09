; DESCRIPTION: Draws a magenta line from (265, 98) to (160, 238).
; PLAN: r0=265(x1), r1=98(y1), r2=160(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 98
LDI r2, 160
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
