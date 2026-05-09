; DESCRIPTION: Draws a magenta line from (39, 200) to (103, 139).
; PLAN: r0=39(x1), r1=200(y1), r2=103(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 200
LDI r2, 103
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
