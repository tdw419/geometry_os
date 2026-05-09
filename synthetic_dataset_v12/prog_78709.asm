; DESCRIPTION: Draws a green line from (75, 107) to (254, 182).
; PLAN: r0=75(x1), r1=107(y1), r2=254(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 107
LDI r2, 254
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
