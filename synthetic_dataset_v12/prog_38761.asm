; DESCRIPTION: Draws a magenta line from (361, 237) to (184, 139).
; PLAN: r0=361(x1), r1=237(y1), r2=184(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 237
LDI r2, 184
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
