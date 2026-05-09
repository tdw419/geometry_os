; DESCRIPTION: Draws a green line from (69, 74) to (12, 252).
; PLAN: r0=69(x1), r1=74(y1), r2=12(x2), r3=252(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 74
LDI r2, 12
LDI r3, 252
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
