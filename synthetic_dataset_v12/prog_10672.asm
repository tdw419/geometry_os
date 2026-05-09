; DESCRIPTION: Draws a magenta line from (288, 64) to (403, 91).
; PLAN: r0=288(x1), r1=64(y1), r2=403(x2), r3=91(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 64
LDI r2, 403
LDI r3, 91
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
