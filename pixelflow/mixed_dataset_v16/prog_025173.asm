; DESCRIPTION: Draws a green line from (480, 154) to (155, 68).
; PLAN: r0=480(x1), r1=154(y1), r2=155(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 154
LDI r2, 155
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
