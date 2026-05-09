; DESCRIPTION: Places a magenta line segment connecting (295, 185) to (292, 206).
; PLAN: r0=295(x1), r1=185(y1), r2=292(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 185
LDI r2, 292
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
