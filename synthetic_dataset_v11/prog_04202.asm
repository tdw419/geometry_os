; DESCRIPTION: Draws a yellow line from (234, 107) to (75, 76).
; PLAN: r0=234(x1), r1=107(y1), r2=75(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 107
LDI r2, 75
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
