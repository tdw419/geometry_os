; DESCRIPTION: Places a yellow line segment connecting (401, 226) to (154, 75).
; PLAN: r0=401(x1), r1=226(y1), r2=154(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 226
LDI r2, 154
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
