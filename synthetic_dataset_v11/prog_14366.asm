; DESCRIPTION: Draws a green line from (108, 106) to (9, 68).
; PLAN: r0=108(x1), r1=106(y1), r2=9(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 106
LDI r2, 9
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
