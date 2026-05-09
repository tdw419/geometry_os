; DESCRIPTION: Places a green line segment connecting (73, 212) to (82, 117).
; PLAN: r0=73(x1), r1=212(y1), r2=82(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 212
LDI r2, 82
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
