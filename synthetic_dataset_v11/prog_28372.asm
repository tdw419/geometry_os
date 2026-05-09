; DESCRIPTION: Draws a green line from (181, 220) to (171, 72).
; PLAN: r0=181(x1), r1=220(y1), r2=171(x2), r3=72(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 220
LDI r2, 171
LDI r3, 72
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
