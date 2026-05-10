; DESCRIPTION: Draws a green line from (264, 117) to (503, 214).
; PLAN: r0=264(x1), r1=117(y1), r2=503(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 117
LDI r2, 503
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
