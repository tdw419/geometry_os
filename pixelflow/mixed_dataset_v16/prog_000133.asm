; DESCRIPTION: Draws a green line from (289, 230) to (171, 100).
; PLAN: r0=289(x1), r1=230(y1), r2=171(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 230
LDI r2, 171
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
