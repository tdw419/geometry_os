; DESCRIPTION: Draws a green line from (331, 61) to (487, 187).
; PLAN: r0=331(x1), r1=61(y1), r2=487(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 61
LDI r2, 487
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
