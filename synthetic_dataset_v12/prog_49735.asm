; DESCRIPTION: Draws a green line from (458, 178) to (290, 249).
; PLAN: r0=458(x1), r1=178(y1), r2=290(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 178
LDI r2, 290
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
