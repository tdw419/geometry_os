; DESCRIPTION: Draws a green line from (10, 93) to (9, 241).
; PLAN: r0=10(x1), r1=93(y1), r2=9(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 93
LDI r2, 9
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
