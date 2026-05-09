; DESCRIPTION: Draws a blue line from (403, 86) to (404, 173).
; PLAN: r0=403(x1), r1=86(y1), r2=404(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 86
LDI r2, 404
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
