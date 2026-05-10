; DESCRIPTION: Draws a magenta line from (124, 172) to (403, 83).
; PLAN: r0=124(x1), r1=172(y1), r2=403(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 172
LDI r2, 403
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
