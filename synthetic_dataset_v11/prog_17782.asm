; DESCRIPTION: Places a yellow line segment connecting (70, 228) to (82, 216).
; PLAN: r0=70(x1), r1=228(y1), r2=82(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 228
LDI r2, 82
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
