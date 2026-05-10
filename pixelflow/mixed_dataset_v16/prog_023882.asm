; DESCRIPTION: Draws a green line from (438, 103) to (236, 117).
; PLAN: r0=438(x1), r1=103(y1), r2=236(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 103
LDI r2, 236
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
