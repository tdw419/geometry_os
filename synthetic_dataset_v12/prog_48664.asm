; DESCRIPTION: Places a yellow line segment connecting (311, 160) to (228, 128).
; PLAN: r0=311(x1), r1=160(y1), r2=228(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 160
LDI r2, 228
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
