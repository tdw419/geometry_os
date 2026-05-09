; DESCRIPTION: Draws a green line from (168, 109) to (115, 194).
; PLAN: r0=168(x1), r1=109(y1), r2=115(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 109
LDI r2, 115
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
