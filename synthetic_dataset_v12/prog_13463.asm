; DESCRIPTION: Places a yellow line segment connecting (212, 180) to (120, 236).
; PLAN: r0=212(x1), r1=180(y1), r2=120(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 180
LDI r2, 120
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
