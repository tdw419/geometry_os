; DESCRIPTION: Draws a magenta line from (211, 40) to (403, 215).
; PLAN: r0=211(x1), r1=40(y1), r2=403(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 40
LDI r2, 403
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
