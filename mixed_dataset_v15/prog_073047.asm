; DESCRIPTION: Draws a magenta line from (46, 204) to (274, 210).
; PLAN: r0=46(x1), r1=204(y1), r2=274(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 204
LDI r2, 274
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
