; DESCRIPTION: Creates a vertical red gradient from black to red.
; PLAN: r0=3(x), r1=10(y), r2=0(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 10
LDI r2, 0
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
