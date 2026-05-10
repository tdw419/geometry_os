; DESCRIPTION: Draws a green line from (271, 20) to (487, 116).
; PLAN: r0=271(x1), r1=20(y1), r2=487(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 20
LDI r2, 487
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
