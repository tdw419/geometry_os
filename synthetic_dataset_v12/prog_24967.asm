; DESCRIPTION: Places a black line segment connecting (292, 188) to (205, 215).
; PLAN: r0=292(x1), r1=188(y1), r2=205(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 188
LDI r2, 205
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
