; DESCRIPTION: Draws a green line from (502, 52) to (118, 179).
; PLAN: r0=502(x1), r1=52(y1), r2=118(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 52
LDI r2, 118
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
