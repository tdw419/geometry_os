; DESCRIPTION: Places a green line segment connecting (221, 228) to (47, 10).
; PLAN: r0=221(x1), r1=228(y1), r2=47(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 228
LDI r2, 47
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
