; DESCRIPTION: Draws a black line from (214, 215) to (404, 48).
; PLAN: r0=214(x1), r1=215(y1), r2=404(x2), r3=48(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 215
LDI r2, 404
LDI r3, 48
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
