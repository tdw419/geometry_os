; DESCRIPTION: Places a white 47x72 box at position (148, 75).
; PLAN: r0=148(x), r1=75(y), r2=47(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 75
LDI r2, 47
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
