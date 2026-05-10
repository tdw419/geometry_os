; DESCRIPTION: Draws a magenta line from (403, 191) to (464, 138).
; PLAN: r0=403(x1), r1=191(y1), r2=464(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 191
LDI r2, 464
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
