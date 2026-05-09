; DESCRIPTION: Places a green line segment connecting (216, 70) to (169, 228).
; PLAN: r0=216(x1), r1=70(y1), r2=169(x2), r3=228(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 70
LDI r2, 169
LDI r3, 228
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
