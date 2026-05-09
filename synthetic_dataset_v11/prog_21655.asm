; DESCRIPTION: Draws a green line from (40, 186) to (69, 68).
; PLAN: r0=40(x1), r1=186(y1), r2=69(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 186
LDI r2, 69
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
