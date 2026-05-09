; DESCRIPTION: Places a green line segment connecting (157, 228) to (54, 160).
; PLAN: r0=157(x1), r1=228(y1), r2=54(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 228
LDI r2, 54
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
