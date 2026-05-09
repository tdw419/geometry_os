; DESCRIPTION: Places a green line segment connecting (74, 30) to (156, 213).
; PLAN: r0=74(x1), r1=30(y1), r2=156(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 30
LDI r2, 156
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
