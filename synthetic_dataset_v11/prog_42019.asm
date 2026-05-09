; DESCRIPTION: Draws a green line from (193, 97) to (27, 153).
; PLAN: r0=193(x1), r1=97(y1), r2=27(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 97
LDI r2, 27
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
