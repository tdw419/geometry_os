; DESCRIPTION: Draws a green line from (12, 188) to (286, 68).
; PLAN: r0=12(x1), r1=188(y1), r2=286(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 188
LDI r2, 286
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
