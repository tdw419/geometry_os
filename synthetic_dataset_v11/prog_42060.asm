; DESCRIPTION: Draws a orange line from (10, 107) to (48, 221).
; PLAN: r0=10(x1), r1=107(y1), r2=48(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 107
LDI r2, 48
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
