; DESCRIPTION: Draws a green line from (13, 109) to (187, 70).
; PLAN: r0=13(x1), r1=109(y1), r2=187(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 109
LDI r2, 187
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
