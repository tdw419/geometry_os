; DESCRIPTION: Draws a green line from (16, 223) to (47, 68).
; PLAN: r0=16(x1), r1=223(y1), r2=47(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 223
LDI r2, 47
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
