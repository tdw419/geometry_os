; DESCRIPTION: Draws a magenta line from (382, 173) to (6, 139).
; PLAN: r0=382(x1), r1=173(y1), r2=6(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 173
LDI r2, 6
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
