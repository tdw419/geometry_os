; DESCRIPTION: Draws a black line from (503, 149) to (403, 164).
; PLAN: r0=503(x1), r1=149(y1), r2=403(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 149
LDI r2, 403
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
